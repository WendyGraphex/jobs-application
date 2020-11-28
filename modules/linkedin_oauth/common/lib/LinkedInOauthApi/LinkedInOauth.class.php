<?php

class LinkedInOauth extends LinkedinOauthApi {
        
    
    function __construct(){      
       parent::__construct($this->getSettings()->get('linkedin_oauth_api_client',''),
                           $this->getSettings()->get('linkedin_oauth_api_secret',''));
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new  LinkedInOauthSettings():$this->settings;     
    }
     
  
    
}
