<?php

class EmployerAdvertRequest extends EmployerAdvertRequestBase {
     
    function __construct($parameters = null,$user=null) {            
         if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);           
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    
     protected function loadByIdAndEmployer($id,EmployerUser $user)
      {                
           $db=mfSiteDatabase::getInstance()->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE id='{id}' AND ".self::getTableField('employer_user_id')."='{employer_user_id}'")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      } 
}