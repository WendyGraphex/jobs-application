<?php

class EmployeeWorkManagerEngine extends ServerCronManagerEngineCore {
    
    protected $date=null;
    
     function __construct($date=null,$options = array()) {         
         $this->date=$date===null?new Day():$date;
         parent::__construct($options);
     }
     
     
     function getSettings()
    {
        return $this->settings=$this->settings===null?new ServerBackupManagerSettings():$this->settings;
    }
    
       
    function getDate()
    {
        return $this->date;
    }
    
    function process()
    {         
        // if > date requested => ACTIVE tous les planned 
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('today'=>(string)$this->getDate()." 12:01:00"))
                ->setQuery("UPDATE ".EmployeeWorkPaymentRequest::getTable().
                          " SET status = 'ACTIVE' ".
                          " WHERE status ='PLANNED' AND requested_at < '{today}'".                                          
                          ";")
                ->makeSqlQuery(); 
         
        //  echo $db->getQuery();
         
        // if > date => ACCEPTED pour tous non refused
         $db=mfSiteDatabase::getInstance()
                ->setParameters(array('today'=>(string)$this->getDate()." 00:00:01"))
                ->setQuery("UPDATE ".EmployeeWorkPaymentRequest::getTable().
                          " SET status = 'ACCEPTED' ".
                          " WHERE status ='ACTIVE' AND status !='REFUSED' AND date < '{today}'".                                          
                          ";")
                ->makeSqlQuery();                   
        return $this;
    }
    
   
    
    function cron()
    {
     /*  $now = new Day();
       if ($this->getSettings()->get('processed_time') && $this->getSettings()->getProcessedTime()->getDay()->getDate() == $now->getDate())
           throw new mfException(__('Already processed today.'));
       $this->setOption('cron', true);       */ 
       return $this->process();
    }
    
}
