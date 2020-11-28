<?php

class PaymentEmployeeEvents extends PaymentEmployeeEventsBase {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('payments_employee'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            'payment_employee_format_reference'=>new mfValidatorString(),
            'payment_employee_format_number'=>new mfValidatorString(),                        
        ));
        $form->getSettings()->add(array(
            'payment_employee_format_reference'=>'PE{year}{month}{day}{id}',
            'payment_employee_format_number'=>'0000'
                ));       
        $form->getComponents()->set("40_00_works","/payments_employee/settings");
    }
       
    
     static function setEmailSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('payments_employee'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "payment_employee_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_payment_employee_email","/payments_employee/emails");
    }  
}

