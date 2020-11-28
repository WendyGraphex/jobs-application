<?php

class GoogleMapEvent {
     
 
    
    
     static function initializationFormConfig(mfEvent $event)
    {
          $form=$event->getSubject();
         if (!mfModule::isModuleInstalled('google_maps',$form->getSite()))
             return ;               
         $form->setValidator('google_map_clean',new mfValidatorBoolean());
    }
    
     static function initializationExecute(mfEvent $event)
    {       
         $form=$event->getSubject();
         if (!mfModule::isModuleInstalled('google_maps',$form->getSite()))
             return ;            
        if ($form->getValue('google_map_clean'))
        {    
             GoogleMapAddress::initializeSite($form->getSite());            
        }
    }
    
}

