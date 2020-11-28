<?php

class EmployerProjectDocument extends EmployerProjectDocumentBase {
     
      function __construct($parameters = null,$user=null) {
       if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);      
        if ($parameters instanceof EmployerProject)      
            $this->set('project_id',$parameters);
         if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);   
        if (is_array($parameters) && isset($parameters['id']) && isset($parameters['file']) && $user instanceof Employee)
           return $this->loadByIdAndFileAndEmployee($parameters['id'],$parameters['file'],$user);    
         if (is_array($parameters) && isset($parameters['id']) && isset($parameters['file']) && $user instanceof EmployerUser)
           return $this->loadByIdAndFileAndEmployer($parameters['id'],$parameters['file'],$user);    
        if ($user) return $this;
        parent::__construct($parameters);
    }
    
    
    function loadByIdAndFileAndEmployee($id,$file,Employee $user)
    {            
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employee_user_id'=>$user->get('id')))  
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().    
                     " INNER JOIN ".EmployerQuotationProjectRequest::getTable()." ON ".EmployerQuotationProjectRequest::getTableField('project_id')."=".self::getTableField('project_id').
                       " WHERE  ".EmployerQuotationProjectRequest::getTableField('employee_user_id')."='{employee_user_id}' ".
                                " AND ".self::getTableField('id')."='{id}'".                              
                       " LIMIT 0,1".
                        ";")                        
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    
     function loadByIdAndFileAndEmployer($id,$file,EmployerUser $user)
    {            
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))  
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                     
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' ".
                                " AND ".self::getTableField('id')."='{id}'".                              
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
    
    static function getMediasForPager(EmployerProjectControllerPager $pager)
    {        
       
         $db=mfSiteDatabase::getInstance()
           ->setParameters(array())         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('project_id')." IN('".$pager->getProjects()->getKeys()->implode("','")."') AND ".                                                      
                                " extension IN('png','jpg','jpeg','gif','svg')".
                        ";")
           ->makeSqlQuery(); 
       //  echo $db->getQuery();
          if (!$db->getNumRows())
                 return ;             
        while ($item=$db->fetchObject('EmployerProjectDocument'))
        {   
            if (!$pager->getProjects()->hasItemByKey($item->get('project_id')))
                continue; 
            $pager->getProjects()->getItemByKey($item->get('project_id'))->getDocuments()->push($item->loaded());          
        }          
    }
}