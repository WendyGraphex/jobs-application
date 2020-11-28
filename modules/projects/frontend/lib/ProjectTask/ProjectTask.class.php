<?php
 
class ProjectTask extends ProjectTaskBase {
     
    function __construct($parameters = null,$user=null) {      
        if ($user instanceof Employee)
              $this->set('employee_user_id',$user);
        $this->getDefaults();
        if ($user instanceof EmployerUser)
              $this->set('employer_user_id',$user);                
        if (is_numeric($parameters) && $user instanceof EmployerUser)        
            return $this->loadByIdAndEmployer($parameters,$user);     
        if (is_numeric($parameters) && $user instanceof Employee)        
            return $this->loadByIdAndEmployee($parameters,$user);   
        if (is_array($parameters) && isset($parameters['id']) && $user instanceof EmployerUser)        
            return $this->loadByIdAndEmployer($parameters['id'],$user);     
        if (is_array($parameters) && isset($parameters['id']) && $user instanceof Employee)        
            return $this->loadByIdAndEmployee($parameters['id'],$user);   
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
}
