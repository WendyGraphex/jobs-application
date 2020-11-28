<?php

class EmployerCompany extends EmployerCompanyBase {
        
     function __construct($parameters = null,$user=null) {
      if ($user instanceof EmployerUser)
            $this->set('employer_user_id',$user);     
      if (is_array($parameters) || $parameters instanceof ArrayAccess)
      {       
           if (isset($parameters['id']) && isset($parameters['url']) && $parameters['url'] instanceof mfString && $user)
            return $this->loadByUrlAndIdAndUser($parameters['url'],$parameters['id'],$user); 
         /* if (isset($parameters['url']) && $user instanceof EmployerUser)
            return $this->loadByUrlAndUser((string)$parameters['url'],$user); */
          if (isset($parameters['id']) && isset($parameters['url']) && $parameters['url'] instanceof mfString)
            return $this->loadByUrlAndId($parameters['url'],$parameters['id'],$user); 
      }   
      if ($user) return ;
      parent::__construct($parameters);
    }
    
    protected function loadByUrlCompanyAndUser(mfString $url,$user)
    {           
        
       $this->set('url',$url);
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE url='{url}' AND status='ACTIVE' AND is_active='YES' AND is_completed='YES' AND is_validated='YES';")
            ->makeSqlQuery();  
        return $this->rowtoObject($db);
    }
    
    protected function loadByUrlAndId(mfString $url,$id)
    {           
       $this->set('url',$url->urldecode());
       $db=mfSiteDatabase::getInstance()           
            ->setParameters(array('url'=>$url->urldecode(),'id'=>$id))              
            ->setQuery("SELECT * FROM ".self::getTable().                      
                       " WHERE url='{url}' AND id='{id}' AND status='ACTIVE' AND is_active='YES' AND is_completed='YES' AND is_validated='YES';")
            ->makeSqlQuery();        
        return $this->rowtoObject($db);
    }
    
     protected function loadByUrlAndIdAndUser(mfString $url,$id,EmployerUser $user)
    {           
        if ($user->getCompany()->get('url') == $url->urldecode() && $user->getCompany()->get('id') == $id)
           return $this->toObject($user->getCompany());
        return $this->loadByUrlAndId($url,$id);        
    }
}
