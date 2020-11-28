<?php

class EmployeeAdvert extends EmployeeAdvertBase {
     
   
      function __construct($parameters = null,$user=null) {       
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof Employee)      
            return $this->loadByIdAndEmployee($parameters,$user);     
        if ($user) return ;
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
    
    
    
    
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
}