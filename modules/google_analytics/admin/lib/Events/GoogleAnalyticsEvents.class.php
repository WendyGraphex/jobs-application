<?php

class GoogleAnalyticsEvents {
                
     static function setSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('google_analytics'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            'google_analytic_key'=>new mfValidatorString(array('required'=>false)),  
            'google_analytic_code'=>new mfValidatorString(array('required'=>false)),   
        ));
        $form->getComponents()->set("80_00_google_analytics","/google_analytics/settings");
    }
    
    
    
}
