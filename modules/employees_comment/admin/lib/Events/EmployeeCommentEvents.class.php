<?php

class EmployeeCommentEvents {
     
 
     static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_comment'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            "employees_comment_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                      
        ));
        $form->getSettings()->add(array());
        $form->getComponents()->set("30_00_employees_comment","/employees_comment/settings");
    }
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees_comment'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employees_comment_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employees_comment_email","/employees_comment/emails");
    }
       
}

