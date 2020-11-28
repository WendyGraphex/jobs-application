<?php



 class SiteHelpI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "title"=> new mfValidatorString(), 
            'description'=> new mfValidatorString(array()), 
            'content'=> new mfValidatorString(array('required'=>false)), 
            ) 
        );      
    }
    
 
}


