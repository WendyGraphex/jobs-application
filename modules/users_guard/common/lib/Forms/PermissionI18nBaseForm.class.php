<?php



 class PermissionI18nBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(            
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'admin'), //   
            "title"=> new mfValidatorString(),      
            ) 
        );                      
    }
    
 
}


