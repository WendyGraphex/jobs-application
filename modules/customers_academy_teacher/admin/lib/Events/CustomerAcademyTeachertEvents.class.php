<?php

class CustomerAcademyTeacherEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('customers_academy_teacher'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
          //  'prefered_countries'=>new mfValidatorChoice(array('key'=>true,'choices'=>QuotationState::getStatesForSelect())),           
     /*       "employee_contact_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_admin_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),
            "employee_congratulation_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotpassword_change_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotpassword_sent_text"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelText::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_forgotemail_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_reference_format"=>new mfValidatorString(array('required'=>false)),
            "employee_id_format"=>new mfValidatorString(array('required'=>false)),  
            "employee_document_limit"=>new mfValidatorInteger(array('required'=>false,'min'=>100,'max'=>1024)),  
            "employee_max_advert_category"=>new mfValidatorInteger(array('min'=>4,'max'=>50)),  
            "employee_min_age"=>new mfValidatorInteger(array('required'=>false,'min'=>13,'max'=>100)),  
            "employee_max_languages"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employee_max_skills"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            "employee_max_diplomas"=>new mfValidatorInteger(array('required'=>false,'min'=>2,'max'=>10)),  
            
            "employee_advert_refused_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_published_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_created_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employee_advert_revival_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            */
        ));
          $form->getSettings()->add(array(
                                  ));
         $form->getComponents()->set("20_00_teachers","/customers_academy_teacher/settings");
    }
       
}

