<?php


class SiteEventDay extends Day {
    
    protected $events=null;
    
    function __construct($date = null, $options = array()) {
        $this->events=new mfArray();
        parent::__construct($date, $options);                
    }
    
   
    
    function getEvents()
    {
        return $this->events;
    }
    
     
    
}

