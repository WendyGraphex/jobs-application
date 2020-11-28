<?php

class CustomerNewsletterEvents {
     
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_newsletter'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "customers_newsletter_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_customers_newsletter","/customers_newsletter/settings");
    }
 
    static function setEmailSettingsForForm(mfEvent $event)
    {    
        if (!mfModule::isModuleInstalled('customers_newsletter'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "customers_newsletter_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_customers_newletter_email","/customers_newsletter/emails");
    }
       
}

