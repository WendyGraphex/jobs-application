<?php

class EmployerEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
          //  'prefered_countries'=>new mfValidatorChoice(array('key'=>true,'choices'=>QuotationState::getStatesForSelect())),           
            "employer_contact_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
          //  "employer_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),
            "employer_congratulation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_forgotpassword_change_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_forgotpassword_sent_text"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_forgotemail_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_user_account_creation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_reference_format"=>new mfValidatorString(array('required'=>false)),
            "employer_id_format"=>new mfValidatorString(array('required'=>false)),       
            "employer_max_advert_category"=>new mfValidatorInteger(array('min'=>4,'max'=>50)),  
            "employer_min_age"=>new mfValidatorInteger(array('required'=>false,'min'=>13,'max'=>100)),  
            "employer_max_languages"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employer_max_adverts"=>new mfValidatorInteger(array('required'=>false,'max'=>50)), 
            
            "employer_advert_refused_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_advert_published_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_advert_created_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_advert_revival_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_alert_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),           
            "employer_lock_time"=>new mfValidatorInteger(array('min'=>5,'max'=>1000)), 
            "employer_document_limit"=>new mfValidatorInteger(array('required'=>false,'min'=>100,'max'=>1024)),  
            "employer_limit_document"=>new mfValidatorInteger(array('required'=>false,'min'=>100,'max'=>1024)),  
            "employer_max_document"=>new mfValidatorInteger(array('required'=>false)),
            "employer_size_document"=>new mfValidatorInteger(array('required'=>false)),
        ));       
         if (!$form->getDefaults())
        {        
           /* $form->getSettings()->add(array('employer_reference_format'=>'{year}{month}{day}{id}',
                                        'employer_id_format'=>'00000',                                      
                                        "employer_max_advert_category"=>5,
                                        "employer_min_age"=>18,
                                        "employer_max_languages"=>5,
            
                                        "employer_max_adverts"=>100,
                                        'employer_limit_document'=>100,
                                        "employer_max_document"=>20,
                                        "employer_size_document"=>16
                                  ));*/
        }
        $form->getComponents()->set("30_00_employers","/employers/settings");
    }
    
    
    static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('employers'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "employer_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
            "employer_alert_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),      
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_employers","/employers/emails");
    }
       
}

