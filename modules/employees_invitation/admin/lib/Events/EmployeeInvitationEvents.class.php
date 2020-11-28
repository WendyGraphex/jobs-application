<?php

class EmployeeInvitationEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_invitation'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employees_invitation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employees_invitation","/employees_invitation/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_invitation'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employees_invitation_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employees_invitation_email","/employees_invitation/emails");
    }
       
}

