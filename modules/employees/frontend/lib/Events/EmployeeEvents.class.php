<?php

class EmployeeEvents extends EmployeeEventsBase {
     
 
    static function updateNumberOfAdverts(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees'))
             return ;
        $advert=$event->getSubject();
        $advert->getEmployeeUser()->addNumberOfAdverts();
    }
     
     static function updateNumberOfQuotations(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;
        $quotation=$event->getSubject();
        if (!$quotation->hasEmployeeAdvert())
            return ;
        $quotation->getEmployeeAdvertI18n()->addNumberOfQuotations();
        
        $quotation->getEmployeeUser()->addNumberOfQuotations();
    }
    
    
     
}

