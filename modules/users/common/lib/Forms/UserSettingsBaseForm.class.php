<?php



 class UserSettingsBaseForm extends mfForm {
 
   
  
    function configure()
    {
        $this->setValidators(array(                       
            "has_manager2"=>new mfValidatorBoolean(array("true"=>"YES","false"=>"NO","empty_value"=>"NO")),
            ) 
        );                      
    }
    
 
}


