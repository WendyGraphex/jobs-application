<?php

class PaymentEmployerEvents extends PaymentEmployerEventsBase {
     
 
        static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_employer'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "payment_employer_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_payments_employer_email","/payments_employer/emails");
    }                
}

