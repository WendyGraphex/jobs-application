<?php

 class ProjectTaskBaseForm extends mfForm {

    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger(),                                    
            "name"=>new mfValidatorString(array("max_length"=>256)), 
            "requested_by"=>new mfValidatorString(array('required'=>false,"max_length"=>64)), 
            "description"=>new mfValidatorString(array("required"=>false,"max_length"=>2048)),          
            'estimated_duration'=> new mfValidatorI18nNumber(array('required'=>false,'min'=>0)),
            'priority'=> new mfValidatorInteger(array('required'=>false,'min'=>0)),
            'color'=> new mfValidatorColor(array('required'=>false)),
            'start_at'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>"a","empty_value"=>null)),
            'end_at'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>"a","empty_value"=>null)),
            'before_at'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>"a","empty_value"=>null)),
          
            'requested_at'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>"a","empty_value"=>null)),
         
            ) 
        );
    }
    
    
    
 
}


