<?php

class PaymentEmployeeSettings extends PaymentEmployeeSettingsBase {
                
    
    function __construct($parameters = null,$user=null) {        
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);      
        if ($parameters instanceof Employee && $user===null)
             $this->loadDefault($parameters);   
        if ($parameters instanceof PaymentMethod && $user instanceof Employee)
             $this->loadByMethodAndUser($parameters,$user);   
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    
     function loadDefault(Employee $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  is_default ='YES'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    
    function loadByMethodAndUser(PaymentMethod $method,Employee $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employee_user_id'=>$user->get('id'),'method_id'=>$method->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  method_id ='{method_id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
      
}