<?php

class CustomerRegistrationEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_registration'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "customers_registration_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_customers_registration","/customers_registration/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_registration'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "customers_registration_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_customers_registration_email","/customers_registration/emails");
    }
       
}

