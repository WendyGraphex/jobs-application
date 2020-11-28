<?php

class Employee extends EmployeeBase {
     
   function __construct($parameters = null,$user=null) {               
      if (is_array($parameters) || $parameters instanceof ArrayAccess)
      {       
          if (isset($parameters['url']) && $user instanceof Employee)
            return $this->loadByUrlAndUser((string)$parameters['url'],$user); 
          if (isset($parameters['url']))
            return $this->loadByUrl((string)$parameters['url']); 
      }     
      if ($parameters instanceof  mfString)    
          return $this->loadByUrl((string)$parameters);     
        if ($user) return null;
        parent::__construct($parameters);
    }
    
              
    protected function loadByUrl($url)
    {           
       $this->set('url',$url);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE url='{url}' AND status='ACTIVE' AND is_active='YES' AND is_completed='YES' AND is_validated='YES';")
            ->makeSqlQuery();      
        return $this->rowtoObject($db);
    }
    
     protected function loadByUrlAndUser($url,Employee $user)
    {           
       $this->set('url',$url);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url,'id'=>$user->get('id')))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE url='{url}' AND id='{id}';")
            ->makeSqlQuery();  
        $this->rowtoObject($db);
        if ($this->isLoaded())
            return ;
       return  $this->loadByUrl($url);
    }
}
