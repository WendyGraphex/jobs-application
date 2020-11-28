<?php

class User extends UserBase {
     
   
    
    
    function updateSession($user,$session_id,$ip=null)
    {        
         if ($this->isNotLoaded())
            return null;
        $session=new Session($session_id);
        $session->add(array("session"=>$session_id,
                        "last_time"=>date('Y-m-d H:i:s'),                      
                        "user_id"=>$this));              
        if ($user->hasLocation())
            $session->setLocation($user->getLocation());                  
        if ($ip)
           $session->set("ip",$ip);        
        $session->save();                
        return $session;
    }
        
    
    function updateRememberMe($ip)
    {
         if ($this->isNotLoaded())
            return null;         
        $cookie_expiration_age=$this->getExpirationAge();        
        // Cleanup en temps et user
        UserRememberUtils::cleanup(date('Y-m-d H:i:s', time() - $cookie_expiration_age), $this);       
        $remember=new UserRemember();
        $remember->add(array('user_id'=>$this,'ip'=>$ip,'expiration_time'=>time() + $cookie_expiration_age));
        $remember->generateRandomKey();
        $remember->save();          
        return $remember;
    }
    
     function setLocation(GPSCoordinate $position)
    {
        $this->add(array('lat'=>$position->getLatitude(),'lng'=>$position->getLongitude()));
    }
   
    function getExpirationAge()
    {        
        return $this->getSettings()->get('cookie_expiration_age',15 * 24 * 3600);  
    }
}
