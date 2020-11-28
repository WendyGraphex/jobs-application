<?php

class EmployerUser extends EmployerUserBase {
     
    function __construct($parameters = null,$user=null) {       
        if (is_numeric($parameters) && $user instanceof EmployerUser)      
            return $this->loadByIdAndEmployer($parameters,$user);     
         if (is_array($parameters) || $parameters instanceof ArrayAccess)
      {       
          if (isset($parameters['url']) && $user instanceof EmployerUser)
            return $this->loadByUrlAndUser((string)$parameters['url'],$user); 
          if (isset($parameters['url']))
            return $this->loadByUrl((string)$parameters['url'],$user); 
      }  
       if ($parameters instanceof  mfString)         
          return $this->loadByUrl((string)$parameters);               
       if ($user) return ;
        parent::__construct($parameters);
    }
    
    function loadByIdAndEmployer($id,EmployerUser $user)
    {       
       $db=mfSiteDatabase::getInstance()
           ->setParameters(array('id'=>$id,'company_id'=>$user->get('company_id')))         
           ->setQuery("SELECT ".self::getFieldsAndKeyWithTable()." FROM ".self::getTable().                   
                       " WHERE  ".self::getTableField('company_id')."='{company_id}' AND  id ='{id}'".                              
                        " LIMIT 0,1".
                        ";")
           ->makeSqlQuery();  
        return $this->rowtoObject($db); 
    }
    
    protected function loadByUrl($url)
    {              
       $this->set('url',$url);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE url='{url}' AND status='ACTIVE' AND is_active='YES' AND is_completed='YES' AND is_validated='YES';")
            ->makeSqlQuery();  
        $this->rowtoObject($db);       
        return $this;
    }
    
     protected function loadByUrlAndUser($url,EmployerUser $user)
    {                    
        if ($user->get('url') == $url)
           return $this->toObject($user);
        return $this->loadByUrl($url);        
    }
    
}
