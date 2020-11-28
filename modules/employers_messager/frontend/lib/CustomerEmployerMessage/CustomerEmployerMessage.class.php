<?php

class CustomerEmployerMessage extends CustomerEmployerMessageBase  {
    
    function __construct($parameters = null,$user) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters))
        {
            $this->loadByIdAndEmployerUser($parameters,$user);
        }
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployerUser($id,EmployerUser $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
        
     
     static function getUnreadMessages(EmployerUser $user,$limit=10)
    {
        static $unread_messages=null;
        if ($unread_messages===null)
        {
            $unread_messages= new CustomerEmployerMessageCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employer_user_id'=>$user->get('id'),'limit'=>$limit))         
                ->setObjects(array("CustomerEmployerMessage","Employee","User"))
                ->setQuery("SELECT {fields} FROM ".CustomerEmployerMessage::getTable().    
                             " LEFT JOIN ". CustomerEmployerMessage::getOuterForJoin('employee_user_id').
                            " LEFT JOIN ". CustomerEmployerMessage::getOuterForJoin('user_id').
                           " WHERE ".CustomerEmployerMessage::getTableField('employer_user_id')."='{employer_user_id}' AND sender !='EMPLOYER'". 
                                " AND ".CustomerEmployerMessage::getTableField('state')."='SENT' ".
                                " AND ".CustomerEmployerMessage::getTableField('deleted_at')." IS NULL ".
                                " AND employer_deleted_at IS NULL ".
                                " AND ".CustomerEmployerMessage::getTableField('read_at')." IS NULL ".  
                           " ORDER BY ".CustomerEmployerMessage::getTableField('created_at')." DESC".
                           " LIMIT 0,{limit}".
                            ";")
                ->makeSqlQuery();  
             if (!$db->getNumRows())
                 return $unread_messages;
             while ($items=$db->fetchObjects())
             {
                 $item=$items->getCustomerEmployerMessage();
                 $item->set('user_id',$items->hasUser()?$items->getUser():false);      
                 $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);      
                 $unread_messages[$item->get('id')]=$item;
             }        
        }   
        return $unread_messages;
    }
    
}
