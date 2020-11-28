<?php

class EmployerAdvert extends EmployerAdvertBase {
     
    function __construct($parameters = null,$user=null) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
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
    
    
    
    
    function upload()
    {
        if ($this->isNotLoaded())
            $this->set('state','UPLOAD')->save();                                        
        return $this;
    }
}