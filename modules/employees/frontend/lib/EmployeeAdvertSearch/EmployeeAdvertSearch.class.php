<?php

class EmployeeAdvertSearch extends EmployeeAdvertSearchBase {
     
    function __construct($parameters = null,$user=null) {            
         if (is_numeric($parameters) && $user instanceof Employee)      
            return $this->loadByIdAndEmployee($parameters,$user);           
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    
     protected function loadByIdAndEmployee($id,Employee $user)
      {                
           $db=mfSiteDatabase::getInstance()->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE id='{id}' AND ".self::getTableField('employee_user_id')."='{employee_user_id}'")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      } 
      
     
}