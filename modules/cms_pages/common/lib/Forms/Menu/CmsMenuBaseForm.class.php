<?php

class CmsMenuBaseForm extends mfForm {
    
    function configure()
    {      
        $this->setValidators(array(
                            "id"=>new mfValidatorInteger(),
                            "name"=>new mfValidatorString(array("required"=>false)),   
                            "target"=>new mfValidatorChoice(array("choices"=>array(""=>'',"_blank"=>"_blank","parent"=>"parent","top"=>"top"),"required"=>false,"empty_value"=>"")),
                            "is_link"=>new mfValidatorBoolean(array('return_value'=>true,'true'=>'YES','false'=>'NO')),
                            "awe"=>new mfValidatorString(array("required"=>false)),   
                            "picture"=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>50 * 1024,
                                    'filename'=>"picture",
                                                 )),
                            "icon"=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>50 * 1024,
                                    'filename'=>"icon",
                                                 )),

                           ));
    }
}

