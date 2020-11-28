<?php

class LinkedinOauthEvents {
                
     static function setSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('linkedin_oauth'))
             return ;      
        $form=$event->getSubject();
        $form->addValidators(array(         
            'linkedin_oauth_api_client'=>new mfValidatorString(array('required'=>false)),                    
            'linkedin_oauth_api_secret'=>new mfValidatorString(array('required'=>false)),                    
        )); 
        $form->getComponents()->set("50_00_linkedin_oauth","/linkedin_oauth/settings");
    }
    
    
    
}
