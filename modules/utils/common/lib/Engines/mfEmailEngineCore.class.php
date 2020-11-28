<?php


abstract class mfEmailEngineCore {
    
    protected $mailer=null,$options=array(),$site=null;
    
    protected static $spooler=null;
        
    function __construct($options=array(),$site=null) {     
       $this->site=$site;
       $this->mailer=mfContext::getInstance()->getMailer($site);           
       $this->options=$options;
       $this->configure();
    }
    
    function configure()
    {
        $this->company=SiteCompany::getSiteCompany($this->getSite());   
    }
    
    function getSite()
    {
        return $this->site;
    }
     
    
    function getCompany()
    {
        return $this->company;
    }
    
    function getMailer()
    {
        return $this->mailer;
    }
    
    function debug()
    {
        if (mfConfig::get('mf_env')=='dev') 
            $this->getMailer()->debug();       
        return $this;
    }
     
    function getAction()
    {
        return $this->action = $this->action === null ? mfContext::getInstance()->getActionStack()->getLastEntry()->getActionInstance():$this->action;
    }
    
    static function getSpooler()
    {
        return  self::$spooler=self::$spooler===null?new EmailerSpoolerCollection():self::$spooler;
    }
}

