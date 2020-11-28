<?php

class CustomerEmployeeMessage extends CustomerEmployeeMessageBase  {
    
    function __construct($parameters = null,Employee $user) {
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters))
        {
            $this->loadByIdAndEmployee($parameters,$user);
        }
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployee($id,Employee $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
        
     
    
    static function getUnreadMessages(Employee $user,$limit=10)
    {
        static $unread_messages=null;
        if ($unread_messages===null)
        {
            $unread_messages= new CustomerEmployeeMessageCollection();
            $db=mfSiteDatabase::getInstance()
                ->setParameters(array('employee_user_id'=>$user->get('id'),'limit'=>$limit))         
                ->setObjects(array("CustomerEmployeeMessage","EmployerUser","User"))
                ->setQuery("SELECT {fields} FROM ".CustomerEmployeeMessage::getTable().    
                             " LEFT JOIN ". CustomerEmployeeMessage::getOuterForJoin('employer_user_id').
                            " LEFT JOIN ". CustomerEmployeeMessage::getOuterForJoin('user_id').
                           " WHERE ".CustomerEmployeeMessage::getTableField('employee_user_id')."='{employee_user_id}' AND sender !='EMPLOYEE'". 
                                " AND state='SENT' AND deleted_at IS NULL AND employee_deleted_at IS NULL AND read_at IS NULL ".  
                           " ORDER BY ".CustomerEmployeeMessage::getTableField('created_at')." DESC".
                           " LIMIT 0,{limit}".
                            ";")
                ->makeSqlQuery();  
             if (!$db->getNumRows())
                 return $unread_messages;
             while ($items=$db->fetchObjects())
             {
                 $item=$items->getCustomerEmployeeMessage();
                 $item->set('user_id',$items->hasUser()?$items->getUser():false);      
                 $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);      
                 $unread_messages[$item->get('id')]=$item;
             }        
        }   
        return $unread_messages;
    }
    
}
