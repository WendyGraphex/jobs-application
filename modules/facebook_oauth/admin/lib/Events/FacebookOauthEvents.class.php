<?php

class FacebookOauthEvents {
                
     static function setSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('facebook_oauth'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            'facebook_app_id'=>new mfValidatorString(array('required'=>true)),  
            'facebook_app_secret'=>new mfValidatorString(array('required'=>true)),  
            
        ));
        $form->getComponents()->set("00_00_facebook_oauth","/facebook_oauth/settings");
    }
    
    
    
}
