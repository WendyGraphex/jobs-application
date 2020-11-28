<?php



 class EmployeeSkillI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "title"=> new mfValidatorString(),                       
            "meta_description"=> new mfValidatorString(array('required'=>false)),  
            "meta_keyword"=> new mfValidatorString(array('required'=>false)),  
            "content"=> new mfValidatorString(array('required'=>false)),  
            ) 
        );      
    }
    
 
}


