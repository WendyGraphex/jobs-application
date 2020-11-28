<?php



 class SystemModelTextI18nBaseForm extends mfForm {
    
  
   
    function configure()
    {        
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),          
            "lang"=> new LanguagesExistsValidator(array(),'frontend'), //   
            "value"=> new mfValidatorString(array('max_length'=>255)),                 
            "text"=> new mfValidatorString(array('max_length'=>32768)),       
            ) 
        );      
    }
    
 
}


