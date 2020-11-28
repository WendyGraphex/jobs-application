<?php

class EmployerProjectEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers_project'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                              
            "employer_project_reference_format"=>new mfValidatorString(array('required'=>false)),
            "employer_project_id_format"=>new mfValidatorString(array('required'=>false)),   
            "employer_project_document_limit"=>new mfValidatorInteger(array('required'=>false,'min'=>100,'max'=>1024)),  
          
        ));
        $form->getSettings()->add(array('employer_project_reference_format'=>'{year}{month}{day}{id}',
                                        'employer_project_id_format'=>'00000',
                                        'employer_project_document_limit'=>100,                                     
                                  ));
        $form->getComponents()->set("40_00_employers_project","/employers_project/settings");        
    }
       
}

