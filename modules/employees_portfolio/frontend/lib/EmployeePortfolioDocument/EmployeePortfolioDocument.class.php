<?php

class EmployeePortfolioDocument  extends EmployeePortfolioDocumentBase  {
     
     function __construct($parameters = null,$user=null) {       
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);
        if ($parameters instanceof Employee )
            $this->set('employee_user_id',$parameters);
       // $this->getDefaults();
        if (is_array($parameters) && isset($parameters['employee']) && isset($parameters['file']) && $parameters['file'] instanceof mfFilename && $user instanceof Employee)
            return $this->loadByFilenameAndEmployeeUsernameAndEmployee($parameters['file'],$parameters['employee'],$user);
        if (is_array($parameters) && isset($parameters['file']) && isset($parameters['employee']) && $parameters['file'] && $user ===null)
            return $this->loadByFilenameAndEmployeeUsernamePublic($parameters['file'],$parameters['employee']);
         if (is_array($parameters) && isset($parameters['file']) && isset($parameters['employee']) && $parameters['file'] && $user instanceof Employer)
            return $this->loadByFilenameAndEmployeeUsernameAndEmployer($parameters['file'],$parameters['employee'],$user);
         if (is_numeric($parameters) && $user instanceof Employee)      
            return $this->loadByIdAndEmployee($parameters,$user);     
         if ($user) return ;
        parent::__construct($parameters);
    }
    
    // get file for employee document
    function loadByFilenameAndEmployeeUsernameAndEmployee(mfFilename $filename,$employee_username,Employee $user)
    {              
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('file'=>$filename->getValue(),'employee_user_id'=>$user->get('id'),'username'=>$employee_username))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                      " INNER JOIN ".self::getOuterForJoin('employee_user_id').
                       " WHERE  file ='{file}' AND ".self::getTableField('is_active')."='YES'".
                            " AND ".Employee::getTableField('username')."='{username}'".
                            " AND ".self::getTableField('employee_user_id')."='{employee_user_id}'".
                       " LIMIT 0,1".
                       ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByFilenameAndEmployeeUsernameAndEmployer(mfFilename $filename,$employee_username)
    {              
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('file'=>$filename->getValue(),'username'=>$employee_username))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                      " INNER JOIN ".self::getOuterForJoin('employee_user_id').
                       " WHERE  file ='{file}' AND ".self::getTableField('is_active')."='YES'".
                            " AND ".Employee::getTableField('username')."='{username}'".
                       " LIMIT 0,1")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function loadByFilenameAndEmployeeUsernamePublic(mfFilename $filename,$employee_username)
    {                    
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('file'=>$filename->getValue(),'username'=>$employee_username))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                      " INNER JOIN ".self::getOuterForJoin('employee_user_id').
                       " WHERE  is_public='Y' AND  file ='{file}' AND ".self::getTableField('is_active')."='YES'".
                            " AND ".Employee::getTableField('username')."='{username}'".
                       " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();        
        return $this->rowtoObject($db); 
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
    
    
    
}
