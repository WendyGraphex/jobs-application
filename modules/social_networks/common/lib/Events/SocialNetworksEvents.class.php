<?php

class SocialNetworksEvents {
        
    
    static function initializationFormConfig(mfEvent $event)
    {           
         $form=$event->getSubject();
         if (!mfModule::isModuleInstalled('social_networks', $form->getSite()))
             return ;                  
         $form->setValidator('social_networks_clean',new mfValidatorBoolean());
    }
    
     static function initializationExecute(mfEvent $event)
    {        
         $form=$event->getSubject();
         if (!mfModule::isModuleInstalled('social_networks', $form->getSite()))
             return ;          
        if ($form->getValue('social_networks'))
        {               
            SocialNetworkUtils::initializeSite($form->getSite());
        }        
    }
}

