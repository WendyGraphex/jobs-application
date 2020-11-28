<?php



 class SiteShopI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "meta_title"=> new mfValidatorString(),                       
            "meta_description"=> new mfValidatorString(array('required'=>false)),
            "meta_keywords"=> new mfValidatorString(array('required'=>false)),
            "meta_author"=> new mfValidatorString(array('required'=>false)),
            ) 
        );      
    }
    
 
}


