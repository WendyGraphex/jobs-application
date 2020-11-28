<?php
  
class InstagramClient extends  Instagram {
    
    protected $settings=null;

    function __construct() {        
        parent::__construct($this->getSettings()->getConfigs());
    }
    
    function getSettings()
    {
        return $this->settings=$this->settings===null?new InstagramOauthSettings():$this->settings;
    }
    
}