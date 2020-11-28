<?php

class SiteEventOrderEventsBase {
     
 
    static function  setOrderPaid(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('site_event_order'))
             return ;
        $payment_event_user=$event->getSubject();                
         // 1 - PaymentDebitEventUser create payment orde for credit
         
         $collection = new SiteEventOrderPaymentCollection($payment_event_user);
         $collection->create();
    }
      
                           
}

