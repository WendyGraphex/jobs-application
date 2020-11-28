<?php

class PaymentEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            'payment_format_reference'=>new mfValidatorString(),
            'payment_format_number'=>new mfValidatorString(),                        
        ));
        $form->getSettings()->add(array(
            'payment_format_reference'=>'P{year}{month}{day}{id}',
            'payment_format_number'=>'0000'
                ));       
        $form->getComponents()->set("20_00_payments","/payments/settings");
    }
       
}

