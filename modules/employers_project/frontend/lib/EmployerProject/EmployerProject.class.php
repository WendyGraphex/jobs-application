<?php

class EmployerProject extends EmployerProjectBase {
     
    function __construct($parameters = null,$user=null) {              
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();              
        if (is_array($parameters) && isset($parameters['reference']) && $parameters['reference'] && $user instanceof EmployerUser)      
            return $this->loadByReferenceAndEmployer($parameters['reference'],$user);  
         if (is_array($parameters) && isset($parameters['reference']) && $parameters['reference'] && $user instanceof Employee)      
            return $this->loadByReferenceAndEmployee($parameters['reference'],$user);  
          if (is_array($parameters) && isset($parameters['url']) && $parameters['url'] && $parameters['lang'] && $user instanceof EmployerUser)      
            return $this->loadByUrlAndEmployer(new mfString($parameters['url']),$parameters['lang'] ,$user);  
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);     
        if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployer($id,EmployerUser $user)
    {               
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByReferenceAndEmployer($reference,EmployerUser $user)
    {                         
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND reference ='{reference}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByReferenceAndEmployee($reference,Employee $user)
    {             
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().    
                     " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('project_id').
                       " WHERE  ".EmployerQuotationProjectRequest::getTableField('employee_user_id')."='{employee_user_id}' AND reference ='{reference}'".                              
                       " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    
     function loadByUrlAndEmployer(mfString $url,$lang,EmployerUser $user)
    {                         
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('url'=>$url->urldecode(),'employer_user_id'=>$user->get('id'),'lang'=>$lang))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().  
                      " INNER JOIN ".EMployerProjectI18n::getInnerForJoin('project_id').
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND url ='{url}' AND lang='{lang}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
   /* function loadByUrlAndEmployee($reference,Employee $user,$lang)
    {             
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'employee_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().    
                     " INNER JOIN ".EmployerQuotationProjectRequest::getInnerForJoin('project_id').
                       " WHERE  ".EmployerQuotationProjectRequest::getTableField('employee_user_id')."='{employee_user_id}' AND reference ='{reference}'".                              
                       " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }*/
    
    
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
    
   
}