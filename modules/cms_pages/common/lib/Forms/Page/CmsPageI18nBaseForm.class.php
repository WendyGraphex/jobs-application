<?php

class CmsPageI18nBaseForm extends mfForm {

   
    
    function configure() {         
        $this->setValidators(array(
            'id' => new mfValidatorInteger(), 
            'page_id'=> new mfValidatorInteger(),
            'url'=>new mfValidatorCmsPageURL(),
            'lang'=> new LanguagesExistsValidator(array(),'frontend'),
            "in_menu"=>new mfValidatorBoolean(array('true'=>'YES','false'=>'NO','empty_value'=>"NO")),
            'is_cached'=> new mfValidatorBoolean(array('true'=>'YES','false'=>'NO','empty_value'=>"NO")),
            'meta_title'=>new mfValidatorString(array("required"=>false)),
            'layout'=>new mfValidatorString(),
            'template'=>new mfValidatorString(),
            'meta_description'=>new mfValidatorString(array("required"=>false)),
            'meta_keywords'=>new mfValidatorString(array("required"=>false)),
            'meta_robots'=>new mfValidatorString(array("required"=>false)),
            'content'=>new mfValidatorString(array("required"=>false)),
            'start_at'=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false)),
            'expired_at'=>new mfValidatorI18nDate(array("date_format"=>"a","required"=>false))
       ));      
    }
    
}

