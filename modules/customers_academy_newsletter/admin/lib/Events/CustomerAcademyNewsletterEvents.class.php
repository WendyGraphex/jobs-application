<?php

class CustomerAcademyNewsletterEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
            "customer_academy_newsletter_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),      
            "customer_academy_newsletter_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                    
        ));
          $form->getSettings()->add(array(
                                  ));
         $form->getComponents()->set("20_00_customers_academy_newsletter","/customers_academy_newsletter/settings");
    }
 
     
       
}

