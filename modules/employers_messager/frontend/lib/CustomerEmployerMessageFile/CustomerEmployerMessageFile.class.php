<?php


class CustomerEmployerMessageFile extends CustomerMessageFile {
     
      
       function __construct($parameters = null,$user=null) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
        if ($parameters instanceof CustomerEmployerMessage && $user===null)
             return $this->loadByMessage($parameters);
        if ($parameters instanceof CustomerEmployerMessage)
            return $this->loadByMessageAndEmployer($parameters,$user);
        if (is_numeric($parameters))        
            return $this->loadByIdAndEmployer($parameters,$user);     
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployer($id,EmployerUser $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().     
                      " INNER JOIN ".self::getOuterForJoin('message_id').
                       " WHERE  ".CustomerMessage::getTableField('employer_user_id')."='{employer_user_id}' AND  ".self::getTableField('id')."='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByMessageAndEmployer(CustomerEmployerMessage $message,EmployerUser $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('message_id'=>$message->get('id'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  message_id ='{message_id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByMessage(CustomerEmployerMessage $message)
    {      
       $this->set('message_id',$message);
    }
    
    function getFileManager()
    {          
        return $this->_file=$this->_file===null?new CustomerEmployerMessageFileManager($this):$this->_file;   
    }
    
   
}
