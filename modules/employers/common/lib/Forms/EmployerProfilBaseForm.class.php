<?php

 

 class EmployerProfilBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(                                                                                                                                                               
                'id'=> new mfValidatorInteger(),
                'lang' => new LanguagesExistsValidator(array(),'frontend',$this->getSite()),                
                'name' => new mfValidatorString(),
                "title"=> new mfValidatorString(array('max_length'=>255)), 
                'description' => new mfValidatorString(),                
                'content' => new mfValidatorString(), 
                "file"=>new mfValidatorFile(array("max_size"=>16 * 1024 * 1024 )),                                       
                'created_at'=> new mfValidatorI18nDate(array('required'=>false)),                
                'updated_at'=>new mfValidatorI18nDate(array('required'=>false)),         
                               
           // 'is_admin'=>new mfValidatorBoolean(array('true'=>'YES','false'=>'NO','empty_value'=>'NO','return_value'=>true)),
                 
            ) 
        );                      
    }
    
 
}