<?php



 class EmployeeLanguageLevelI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "title"=> new mfValidatorString(),                       
            ) 
        );      
    }
    
 
}


