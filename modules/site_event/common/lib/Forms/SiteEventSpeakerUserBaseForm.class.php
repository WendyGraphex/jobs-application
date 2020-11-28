<?php

class SiteEventSpeakerUserBaseForm extends mfForm {

    
    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
            'gender'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
            'firstname' => new mfValidatorString(), // @TODO define min max + messages
            'lastname' => new mfValidatorString(), // @TODO define min max + messages
            'email' => new mfValidatorEmail(), 
            'mobile'=>new mfValidatorString(array('required'=>false)),           
            'phone'=>new mfValidatorString(array('required'=>false)),    
            'address1'=>new mfValidatorString(array('required'=>false)),      
            'address2'=>new mfValidatorString(array('required'=>false)),      
            'postcode'=>new mfValidatorString(array('required'=>false)),      
            'city'=>new mfValidatorString(array('required'=>false)),      
            'state'=>new mfValidatorString(array('required'=>false)),      
            'country' => new mfValidatorI18nChoiceCountry(array()),
            'avatar'=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>1 * 1024 * 1024,
                                    'filename'=>"picture",
                                                 )
                                            )       
        ));
    }
}