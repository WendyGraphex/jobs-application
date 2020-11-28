<?php

class SiteEventEventsBase {
     
 
    static function  setUpdateEventAvailability(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('site_event'))
             return ;
        $payment_event_user=$event->getSubject();                
        // update availability of events
         
        
    }
      
                           
}

