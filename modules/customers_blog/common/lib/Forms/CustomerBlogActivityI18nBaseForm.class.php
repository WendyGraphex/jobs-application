<?php



 class CustomerBlogActivityI18nBaseForm extends mfForm {
    
    
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'),
            "title"=> new mfValidatorString(),                       
            "meta_title"=> new mfValidatorString(array('required'=>false)),         
           // "url"=> new mfValidatorCustomerBlogActivityURL(), 
            "url"=> new mfValidatorString(array('required'=>false)),
            "meta_description"=> new mfValidatorString(array('required'=>false)),  
            "meta_keywords"=> new mfValidatorString(array('required'=>false)),  
            "meta_robots"=> new mfValidatorString(array('required'=>false)),  
            "content"=> new mfValidatorString(array('required'=>false)),  
            ) 
        );      
    }
    
 
}


