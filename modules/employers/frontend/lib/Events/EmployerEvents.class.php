<?php

class EmployerEvents extends EmployerEventsBase {
     
 
    static function updateNumberOfAdverts(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;
        $advert=$event->getSubject();
        $advert->getEmployerUser()->addNumberOfAdverts();
    }
       
    
    static function updateNumberOfQuotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;
        $quotation=$event->getSubject();
        if (!$quotation->hasEmployerAdvert())
            return ;
        $quotation->getEmployerAdvertI18n()->addNumberOfQuotations();
        
        $quotation->getEmployerUser()->addNumberOfQuotations();
    }
    
     
}

