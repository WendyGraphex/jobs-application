<?php

class GoogleAnalyticsEvents {
               
    static function tracking(mfEvent $event)
    {       
        if (!mfModule::isModuleInstalled('google_analytics'))
            return; 
        $smarty=$event->getSubject();     
        $event->setReturnValue($event->getReturnValue().mfContext::getInstance()->getComponentController()->getComponentContent('/google_analytics/tag',array(),$smarty));        
    }
       
}

