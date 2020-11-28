<?php

class SiteEventPlaceNewForm extends SiteEventPlaceBaseForm {

    protected $event_user=null;
    
    function __construct(SiteEventUser $event_user,$defaults = array(), $options = array()) {
        $this->event_user=$event_user;
        parent::__construct($defaults, $options);
    }
    
    function getEventUser()
    {
        return $this->event_user;
    }
    
    function configure() { 
      parent::configure();
      unset($this['id']);            
    } 
    
    
    function getValues() {
        $values=parent::getValues();
        $values['event_user_id']=$this->getEventUser();
        return $values;
    }
}