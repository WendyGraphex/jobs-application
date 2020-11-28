<?php


class CustomerEmployeeMessageFile extends CustomerMessageFile {
     
      
       function __construct($parameters = null,$user=null) {
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);
        $this->getDefaults();
        if ($parameters instanceof CustomerEmployeeMessage && $user===null)
             return $this->loadByMessage($parameters);
        if ($parameters instanceof CustomerEmployeeMessage)
            return $this->loadByMessageAndEmployee($parameters,$user);
        if (is_numeric($parameters))        
            return $this->loadByIdAndEmployee($parameters,$user);     
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployee($id,Employee $user)
    {
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().     
                      " INNER JOIN ".self::getOuterForJoin('message_id').
                       " WHERE  ".CustomerMessage::getTableField('employee_user_id')."='{employee_user_id}' AND  ".self::getTableField('id')."='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByMessageAndEmployee(CustomerEmployeeMessage $message,Employee $user)
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
    
    function loadByMessage(CustomerEmployeeMessage $message)
    {      
       $this->set('message_id',$message);
    }
    
    function getFileManager()
    {          
        return $this->_file=$this->_file===null?new CustomerEmployeeMessageFileManager($this):$this->_file;   
    }
}
