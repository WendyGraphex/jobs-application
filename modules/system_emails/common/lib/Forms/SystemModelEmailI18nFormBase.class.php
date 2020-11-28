<?php



 class SystemModelEmailI18nBaseForm extends mfForm {
    
  
   
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'), //   
            "value"=> new mfValidatorString(array('max_length'=>255)),       
            "subject"=> new mfValidatorString(array('max_length'=>255)),  
            "body"=> new mfValidatorString(array('max_length'=>32768)),       
            )
        );      
    }
    
 
}


