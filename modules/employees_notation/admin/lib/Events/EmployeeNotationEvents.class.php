<?php

class EmployeeNotationEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {       
        if (!mfModule::isModuleInstalled('employees_notation'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employees_notation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employees_notation","/employees_notation/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {       
        if (!mfModule::isModuleInstalled('employees_notation'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employees_notation_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employees_notation_email","/employees_notation/emails");
    }
       
}

