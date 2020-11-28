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
            'customer'=>new mfValidatorString(array('required'=>false,"max_length"=>64)), 
            'requested_at'=>new mfValidatorI18nDate(array('required'=>false,'date_format'=>"a","empty_value"=>null)),
            'version'=>new mfValidatorString(array('required'=>false,"max_length"=>64)),
            'theme'=>new mfValidatorString(array('required'=>false,"max_length"=>64)),
            'module'=>new mfValidatorString(array('required'=>false,"max_length"=>64)),
            'action'=>new mfValidatorString(array('required'=>false,"max_length"=>64)),
            ) 
        );
    }
    
    function getValues()
    {
        $values=parent::getValues();    
        if ($this->hasValidator('estimated_duration'))
            $values['estimated_duration']=$values['estimated_duration']?(int)($values['estimated_duration'] * 3600):null;   
      //  if ($this->hasValidator('duration'))
      //      $values['duration']=$values['duration']?(int)$values['duration'] * 10:null;
        return $values;
    }
    
 
}


