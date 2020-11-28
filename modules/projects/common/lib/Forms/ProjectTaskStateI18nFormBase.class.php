<?php



 class ProjectTaskStateI18nBaseForm extends mfForm {
    
   
   
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),   
            "value"=> new mfValidatorString(),                       
            ) 
        );      
    }
    
 
}


