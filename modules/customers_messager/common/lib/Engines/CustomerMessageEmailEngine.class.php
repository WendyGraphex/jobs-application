<?php

class CustomerMessageEmailEngine extends mfEmailEngineCore {
    
    protected $company=null,$mailer=null,$settings=null,$message=null;
    
    function __construct() {     
       $this->mailer=mfContext::getInstance()->getMailer();
       $this->company=SiteCompany::getSiteCompany();
       $this->settings=new CustomerMessagerSettings();
       $this->configure();       
    }
    
    function configure()
    {
        return $this;
    }
    
    function getCompany()
    {
        return $this->company;
    }
    
    function getMailer()
    {
        return $this->mailer;
    }
    
     function getSettings()
    {
        return $this->settings;
    }
    
    function getMessage()
    {
        return $this->message;
    }
}
