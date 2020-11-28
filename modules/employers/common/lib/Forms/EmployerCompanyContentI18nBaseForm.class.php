<?php



 class EmployerCompanyContentI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),         
            "description"=> new mfValidatorString(array('required'=>false)),                                
            "meta_title"=> new mfValidatorString(array('required'=>false)),                   
            "meta_description"=> new mfValidatorString(array('required'=>false)),  
            "meta_keywords"=> new mfValidatorString(array('required'=>false)),  
            "meta_robots"=> new mfValidatorString(array('required'=>false)),           
            ) 
        );      
    }
    
 
}


