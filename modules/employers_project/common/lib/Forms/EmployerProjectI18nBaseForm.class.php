<?php


 class EmployerProjectI18nBaseForm extends mfForm {
 
   
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
            'title'=>new mfValidatorString(array('max_length'=>128)),
            'short_description'=>new mfValidatorString(array('max_length'=>512)),
            'content'=>new mfValidatorString(array('max_length'=>32768)),
        ));
    }
    
 
}


