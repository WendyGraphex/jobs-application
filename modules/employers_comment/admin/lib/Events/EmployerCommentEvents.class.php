<?php

class EmployerCommentEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_comment'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employers_comment_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employers_comment","/employers_comment/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_comment'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employers_comment_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employers_comment_email","/employers_comment/emails");
    }
       
}

