<?php

class ProjectDocument extends ProjectDocumentBase {
     
  function __construct($parameters = null,$user=null) {                   
        if ($user instanceof Employee)
            $this->set('employee_user_id',$user);                     
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);        
        if ($parameters instanceof ProjectTask && $user)
            return $this->loadByTask($parameters , $user);  
        if (is_numeric($parameters) && $user instanceof Employee)
            return $this->loadByIdAndEmployee($parameters,$user);        
         if (is_numeric($parameters) && $user instanceof EmployerUser)
            return $this->loadByIdAndEmployer($parameters,$user);  
        if (is_array($parameters) && $user instanceof Employee && isset($parameters['file']) && isset($parameters['id']))
            return $this->loadByIdAndFileAndEmployee($parameters['file'],$parameters['id'],$user);        
         if (is_array($parameters) && $user instanceof EmployerUser && isset($parameters['file']) && isset($parameters['id']))
            return $this->loadByIdAndFileAndEmployer($parameters['file'],$parameters['id'],$user);           
        if ($user) return ;
        parent::__construct($parameters);
    }
    
     
     function loadByIdAndFileAndEmployee($file,$id,Employee $employee)
    {            
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$employee->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}' AND employee_user_id='{employee_user_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
     
     function loadByIdAndFileAndEmployer($file,$id,EmployerUser $employee)
    {            
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$employee->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}' AND employer_user_id='{employer_user_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
    
      function loadByIdAndEmployer($id,EmployerUser $employer)
    {            
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$employer->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}' AND employer_user_id='{employer_user_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
    
      function loadByIdAndEmployee($id,Employee $employee)
    {            
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$employee->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                       
                      " WHERE ".self::getTableField('id')." ='{id}' AND employee_user_id='{employee_user_id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
         return $this->rowtoObject($db);         
    }
    
    function loadByTask(ProjectTask $task,$user)
    {                    
       $this->set('task_id',$task);
       $this->set('project_id',$task->get('project_id'));
       $this->set('employee_user_id',$task->get('employee_user_id'));
       $this->set('employer_user_id',$task->get('employer_user_id'));
    }
    
    
}