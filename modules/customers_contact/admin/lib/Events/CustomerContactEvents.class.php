<?php

class CustomerContactEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_contact'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "customers_contact_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_customers_contact","/customers_contact/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_contact'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "customers_contact_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_customers_contact","/customers_contact/emails");
    }
       
}

