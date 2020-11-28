<?php

class PaymentDebitEventUserEvents extends PaymentDebitEventUserEventsBase {
     
 
        static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_event_user'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "payment_debit_event_user_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_payments_event_user_email","/payments_event_user/emails");
    }                
}

