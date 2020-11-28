<?php

class PaymentEmployerEventsBase {
     
 
     static function setPaymentAccepted(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_employer'))
             return ;
        $payment = $event->getSubject();    //PaymentEmployerUser    
        if (!$payment->isAccepted()) 
            return ;
           
       $engine =new PaymentEmployerEmailEngine($payment);
       $engine->sendCreated();                     
       $engine->sendEmployeeQuotationPaid();
    }                   
}

