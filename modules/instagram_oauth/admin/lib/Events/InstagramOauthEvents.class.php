<?php

class InstagramOauthEvents {
                
     static function setSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('instagram_oauth'))
             return ;      
        $form=$event->getSubject();
         $form->addValidators(array(         
            'instagram_ouath_api_key'=>new mfValidatorString(array('required'=>false)),     
            'instagram_ouath_api_secret'=>new mfValidatorString(array('required'=>false)),     
        )); 
        $form->getComponents()->set("50_00_instagram_oauth","/instagram_oauth/settings");
    }
    
    
    
}
