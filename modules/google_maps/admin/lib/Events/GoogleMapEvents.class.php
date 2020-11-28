<?php

class GoogleMapEvents {
    
    
 static function SetSettingsForForm(mfEvent $event)
 {
       if (!mfModule::isModuleInstalled('google_maps'))
            return ;
      $form=$event->getSubject();
        $form->addValidators(array(         
            'google_map_key'=>new mfValidatorString(array('required'=>true)),             
        ));
        $form->getComponents()->set("80_00_google_maps","/google_maps/settings");
 }

}
