<?php

class EmployerProjectI18n extends EmployerProjectI18nBase {
     
   function __construct($parameters = null,EmployerUser $user) {
        if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);
        $this->getDefaults();
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);     
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployer($id,EmployerUser $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'employer_user_id'=>$user->get('id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                      " INNER JOIN ".self::getOuterForJoin('project_id').
                      " WHERE  ".self::getTableField('employer_user_id')."='{employer_user_id}' AND  ".self::getTableField('id')."='{id}'".                              
                      " LIMIT 0,1".
                      ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    function getUrl()
    {
        return url_i18n_to("employers_project_project",array('url'=>$this->get('url')),$this->get('lang'),'frontend');
    }
}
