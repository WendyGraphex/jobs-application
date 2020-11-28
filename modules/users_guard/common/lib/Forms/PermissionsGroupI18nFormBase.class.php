<?php



 class PermissionsGroupI18nBaseForm extends mfForm {
    
    function __construct($defaults = array()) {
        parent::__construct($defaults);
    }
   
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'admin'), //   
            "value"=> new mfValidatorString(),                       
            ) 
        );      
    }
    
 
}


