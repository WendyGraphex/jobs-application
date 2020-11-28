<?php

class EmployerNotationEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_notation'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employers_notation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employers_notation","/employers_notation/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_notation'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employers_notation_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employers_notation_email","/employers_notation/emails");
    }
       
}

