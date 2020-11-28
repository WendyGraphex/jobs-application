<?php

class EmployeeEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
           //  'prefered_countries'=>new mfValidatorChoice(array('key'=>true,'choices'=>QuotationState::getStatesForSelect())),           
            "employee_contact_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
         //   "employee_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),
            "employee_congratulation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotpassword_change_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotpassword_sent_text"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotemail_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_reference_format"=>new mfValidatorString(array('required'=>false)),
            "employee_id_format"=>new mfValidatorString(array('required'=>false)),  
            "employee_limit_document"=>new mfValidatorInteger(array('required'=>false,'min'=>100,'max'=>1024)),  
            "employee_max_document"=>new mfValidatorInteger(array('required'=>false)),
            "employee_size_document"=>new mfValidatorInteger(array('required'=>false)),
            
            "employee_max_advert_category"=>new mfValidatorInteger(array('min'=>4,'max'=>50)),  
            "employee_min_age"=>new mfValidatorInteger(array('required'=>false,'min'=>13,'max'=>100)),  
            "employee_max_languages"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employee_max_skills"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employee_max_diplomas"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employee_max_adverts"=>new mfValidatorInteger(array('required'=>false,'max'=>50)), 
            "employee_lock_time"=>new mfValidatorInteger(array('min'=>5,'max'=>1000)), 
            "employee_alert_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),           
            "employee_advert_refused_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_published_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_created_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_revival_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
        ));
        
        if (!$form->getDefaults())
        {    
         /* $form->getSettings()->add(array('employee_reference_format'=>'{year}{month}{day}{id}',
                                        'employee_id_format'=>'00000',                                       
                                        "employee_max_advert_category"=>5,
                                        "employer_min_age"=>18,
                                        "employee_max_languages"=>5,
                                        "employee_max_skills"=>5,
                                        "employee_max_diplomas"=>5,
                                        "employee_max_adverts"=>50,
                                        'employee_limit_document'=>50,
                                        "employee_max_document"=>20,
                                        "employee_size_document"=>16
                                  ));*/
        }
         $form->getComponents()->set("20_00_employees","/employees/settings");
    }
 
     static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employees'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employee_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),  
            "employee_alert_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),      
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employee","/employees/emails");
    }
       
}

