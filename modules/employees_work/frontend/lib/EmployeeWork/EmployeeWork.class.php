<?php

class EmployeeWork extends EmployeeWorkBase {
    
       
    function __construct($parameters = null,$user=null) {      
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
        if ($parameters instanceof SaleOrder && $user instanceof EmployerUser)
             $this->loadByOrderAndEmployer($parameters,$user);    
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);          
        if (is_array($parameters) || ($parameters instanceof ArrayAccess && $user instanceof EmployerUser))
        {
            if (isset($parameters['reference']))
               return $this->loadbyReferenceAndUser((string)$parameters['reference'],$user);            
        }    
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
    
    
    function loadByReferenceAndUser($reference,EmployerUser $user)
    {             
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('reference'=>$reference,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT * FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  reference ='{reference}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
}