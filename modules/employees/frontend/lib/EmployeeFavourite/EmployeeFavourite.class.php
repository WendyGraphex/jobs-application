<?php

class EmployeeFavourite extends EmployeeFavouriteBase {
     
    function __construct($parameters = null,$user=null) {      
        if ($parameters instanceof EmployerUser && $user instanceof Employee)      
            return $this->loadByEmployerAndEmployee($parameters,$user);     
        if ($parameters instanceof Employee && $user instanceof Employee)      
            return $this->loadByEmployeeAndEmployee($parameters,$user);            
        if ($parameters instanceof EmployeeAdvertI18n && $user instanceof Employee)      
            return $this->loadByEmployeeAdvertI18nAndEmployee($parameters,$user);     
        if ($parameters instanceof EmployerAdvertI18n && $user instanceof Employee)      
            return $this->loadByEmployerAdvertI18nAndEmployee($parameters,$user);    
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
      
     
    function loadByEmployerAndEmployee(EmployerUser $employer,Employee $user)
    {              
       $this->set('employer_id',$employer->get('id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employer_id'=>$employer->get('id'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  employer_id ='{employer_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByEmployeeAndEmployee(Employee $employee,Employee $user)
    {              
       $this->set('employee_id',$employee->get('id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employee_id'=>$employee->get('id'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  employee_id ='{employee_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
 
    
     function loadByEmployeeAdvertI18nAndEmployee(EmployeeAdvertI18n $advert_i18n,Employee $user)
    {       
       $this->set('employee_advert_lang',$advert_i18n->get('lang'));
       $this->set('employee_advert_id',$advert_i18n->get('advert_id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  employee_advert_id ='{advert_id}' AND employee_advert_lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByEmployerAdvertI18nAndEmployee(EmployerAdvertI18n $advert_i18n,Employee $user)
    {           
       $this->set('employer_advert_lang',$advert_i18n->get('lang'));
       $this->set('employer_advert_id',$advert_i18n->get('advert_id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  employer_advert_id ='{advert_id}' AND employer_advert_lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    } 
}
