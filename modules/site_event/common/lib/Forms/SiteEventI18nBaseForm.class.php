<?php



 class SiteEventI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "meta_title"=> new mfValidatorString(),    
            "url"=> new mfValidatorString(),                
            "meta_description"=> new mfValidatorString(array('required'=>false)),  
            "short_description"=> new mfValidatorString(array('required'=>false)),  
            "meta_keyword"=> new mfValidatorString(array('required'=>false)),  
            "content"=> new mfValidatorString(array('required'=>false)),  
            ) 
        );      
    }
    
 
}


