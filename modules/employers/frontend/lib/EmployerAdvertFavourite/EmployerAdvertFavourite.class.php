<?php

class EmployerAdvertFavourite extends EmployerAdvertFavouriteBase {
     
    
        function __construct($parameters = null,$user=null) {      
            
        if ($parameters instanceof EmployerAdvertI18n && $user instanceof Employee)      
            return $this->loadByAdvertI18nAndEmployee($parameters,$user);     
        if ($parameters instanceof EmployerAdvertI18n && $user instanceof EmployerUser)      
            return $this->loadByAdvertI18nAndEmployer($parameters,$user);              
        if ($user) return ;
        parent::__construct($parameters);
    }
    
     function loadByAdvertI18nAndEmployee(EmployerAdvertI18n $advert_i18n,Employee $user)
    {       
       $this->set('lang',$advert_i18n->get('lang'));
       $this->set('advert_id',$advert_i18n->get('advert_id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),'lang'=>$advert_i18n->get('lang'),'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employee_user_id')."='{employee_user_id}' AND  advert_id ='{advert_id}' AND lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
     function loadByAdvertI18nAndEmployer(EmployerAdvertI18n $advert_i18n,EmployerUser $user)
    {      
       $this->set('lang',$advert_i18n->get('lang'));
       $this->set('advert_id',$advert_i18n->get('advert_id'));
       $this->set('employee_user_id',$user);    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('advert_id'=>$advert_i18n->get('advert_id'),
                                'lang'=>$advert_i18n->get('lang'),
                                'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  advert_id ='{advert_id}' AND lang='{lang}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
       
    
}
