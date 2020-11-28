<?php

class EmployerContactEvents extends ProjectEventsBase {
     
 
   /* static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('projects'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(                  
            'project_format_reference'=>new mfValidatorString(),
            'project_format_number'=>new mfValidatorString(),                        
        ));
        $form->getSettings()->add(array(
            'project_format_reference'=>'PR{year}{month}{day}{id}',
            'project_format_number'=>'0000'
                ));       
        $form->getComponents()->set("25_00_projects","/projects/settings");
    }*/
       
     static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_contact'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employers_contact_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employers_contact_email","/employers_contact/emails");
    }   
}

