<?php

class CustomerMessagerEvents {
     
 
    static function setSettingsForForm(mfEvent $event)
    {      
        if (!mfModule::isModuleInstalled('customers_messager'))
             return ;
        $form=$event->getSubject();
        $form->addValidators(array(         
          
            "employee_first_message_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
            "employer_first_message_model"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>SystemModelEmail::getModelsForSelect()->unshift(array(""=>"")))),            
           
        ));
          $form->getSettings()->add(array( 
                                  ));
         $form->getComponents()->set("30_00_customers_messager","/customers_messager/settings");
    }
       
}

