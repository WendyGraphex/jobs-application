<?php

class EmployerInvitationEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_invitation'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employers_invitation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employers_invitation","/employers_invitation/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_invitation'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employers_invitation_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employers_invitation_email","/employers_invitation/emails");
    }
       
}

