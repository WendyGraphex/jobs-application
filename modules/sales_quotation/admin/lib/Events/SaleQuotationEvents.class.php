<?php

class SaleQuotationEvents extends SaleQuotationEventsBase {
     
 
    static function setSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales_quotation'))
             return ;
        $form=$event->getSubject();        
         $form->addValidators(array(                  
            'quotation_format_reference'=>new mfValidatorString(),
            'quotation_format_number'=>new mfValidatorString(),
             
            "employee_quotation_proposed_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employer_quotation_refused_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employer_quotation_negociated_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employer_quotation_accepted_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employer_quotation_revival_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),


            "employee_quotation_refused_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employee_quotation_negociated_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employee_quotation_accepted_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "employee_quotation_revival_email_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),
            "quotation_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)), 
                       
            'quotation_accepted_email_model'=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                         
             
            'quotation_admin_email_model'=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),                       
        ));
        $form->getSettings()->add(array(
            'quotation_format_reference'=>'Q{year}{month}{day}{id}',
            'quotation_format_number'=>'0000'
                ));       
        $form->getComponents()->set("20_00_sales_quotation","/sales_quotation/settings");
    }
      
       static function setEmailSettingsForForm(mfEvent $event)
    {
        if (!mfModule::isModuleInstalled('sales_quotation'))
             return ;       
        $form=$event->getSubject();
        $form->addValidators(array(                               
            "quotation_recipients"=>new mfValidatorMultiple(new mfValidatorEmail(),array('required'=>false)),            
        ));
        $form->getSettings()->add(array( 
                                  ));
        $form->getComponents()->set("30_00_sales_quotation_email","/sales_quotation/emails");
    }  
                    
}

