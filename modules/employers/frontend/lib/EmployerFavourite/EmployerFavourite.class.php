<?php

class EmployerFavourite extends EmployerFavouriteBase {
     
    function __construct($parameters = null,$user=null) {      
        if ($parameters instanceof EmployerUser && $user instanceof EmployerUser)      
            return $this->loadByEmployerAndEmployer($parameters,$user);     
        if ($parameters instanceof Employee && $user instanceof EmployerUser)      
            return $this->loadByEmployeeAndEmployer($parameters,$user);   
        if ($parameters instanceof EmployeeAdvertI18n && $user instanceof EmployerUser)      
            return $this->loadByEmployeeAdvertI18nAndEmployer($parameters,$user);     
        if ($parameters instanceof EmployerAdvertI18n && $user instanceof EmployerUser)      
            return $this->loadByEmployerAdvertI18nAndEmployer($parameters,$user);       
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);           
        if ($user) return ;
        parent::__construct($parameters);
    }
    
     
      
       protected function loadByIdAndEmployer($id,EmployerUser $user)
      {                
           $db=mfSiteDatabase::getInstance()->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')));
           $db->setQuery("SELECT * FROM ".self::getTable()." WHERE id='{id}' AND ".self::getTableField('employer_user_id')."='{employer_user_id}'")
              ->makeSqlQuery();                           
           return $this->rowtoObject($db);
      } 
    
    
    function loadByEmployerAndEmployer(EmployerUser $employer,EmployerUser $user)
    {              
       $this->set('employer_id',$employer->get('id'));
       $this->set('employer_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employer_id'=>$employer->get('id'),'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  employer_id ='{employer_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByEmployeeAndEmployer(Employee $employee,EmployerUser $user)
    {              
       $this->set('employee_id',$employee->get('id'));
       $this->set('employer_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('employee_id'=>$employee->get('id'),'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  employee_id ='{employee_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
       
    
      function loadByEmployeeAdvertI18nAndEmployer(EmployeeAdvertI18n $advert_i18n,EmployerUser $user)
    {       
       $this->set('employee_advert_lang',$advert_i18n->get('lang'));
       $this->set('employee_advert_id',$advert_i18n->get('advert_id'));
       $this->set('employer_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  employee_advert_id ='{advert_id}' AND employee_advert_lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByEmployerAdvertI18nAndEmployer(EmployerAdvertI18n $advert_i18n,EmployerUser $user)
    {           
       $this->set('employer_advert_lang',$advert_i18n->get('lang'));
       $this->set('employer_advert_id',$advert_i18n->get('advert_id'));
       $this->set('employer_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  employer_advert_id ='{advert_id}' AND employer_advert_lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    } 
}
