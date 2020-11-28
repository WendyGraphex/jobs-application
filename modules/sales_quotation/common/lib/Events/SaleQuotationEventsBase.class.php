<?php

class SaleQuotationEventsBase {
     
 
    
    static function setQuotationPaid(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales_quotation'))
             return ;
        $payment = $event->getSubject();    //PaymentEmployerUser    
        if (!$payment->isAccepted()) 
            return ;
        $payment->setQuotationsToPaid();     
                
    }                       
}

