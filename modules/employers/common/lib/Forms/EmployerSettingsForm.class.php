<?php



 class EmployerSettingsForm extends mfForm {
 
   
    function configure()
    {        
        $this->setValidators(array(            
          
            // "forgotpassword_email"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>array(""=>"")+SystemModelEmail::getModelsForSelect())),            
            // "forgotpassword_sent_text"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>array(""=>"")+SystemModelText::getModelsForSelect())),            
            // "forgotpassword_confirm_text"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>array(""=>"")+SystemModelText::getModelsForSelect())),                               
            // "preferred_countries"=>new mfValidatorVariablesForImport(array('required'=>false,'separator'=>',')),
            // "new_holidays_model_email"=>new mfValidatorChoice(array("key"=>true,'required'=>false,"choices"=>array(""=>"")+SystemModelEmail::getModelsForSelect())),            
            // 'nb_of_fails_for_employee'=>new mfValidatorInteger(array('required'=>false)),
            ) 
        );                      
    }
     
       
}


