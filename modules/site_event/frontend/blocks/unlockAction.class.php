<?php


class site_event_unlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();      
        $this->settings=new SiteEventSettings();     
    } 
    
    
}