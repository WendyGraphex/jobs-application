<?php



 class SiteWarningI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "title"=> new mfValidatorString(array('required'=>false)), 
            'description'=> new mfValidatorString(array('required'=>false)), 
            'content'=> new mfValidatorString(array('required'=>false)), 
            ) 
        );      
    }
    
 
}


