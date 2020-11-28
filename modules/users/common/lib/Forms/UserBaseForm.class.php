<?php

class UserBaseForm extends mfForm {

    protected $lang=null;
    
    function __construct($lang,$defaults = array()) {                
        $this->lang=$lang;
        parent::__construct($defaults, array());
    }
    
    function configure() {       
        $this->setValidators(array(
            'id'=>new mfValidatorInteger(),
            'sex'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
            'firstname' => new mfValidatorName(), // @TODO define min max + messages
            'lastname' => new mfValidatorName(), // @TODO define min max + messages
            'email' => new mfValidatorEmail(), 
            'mobile'=>new mfValidatorI18nMobile(array('required'=>false)),
            'updated_at' =>new mfValidatorI18nDate(array('required'=>false)),
            'lastlogin' =>new mfValidatorI18nDate(array('required'=>false)),
            'last_password_gen' =>new mfValidatorI18nDate(array('required'=>false)),
           // 'team_id'=>new mfValidatorChoice(array('key'=>true,'choices'=>array(0=>"No team")+UserTeamUtils::getFieldValuesForSelect('name',$this->getSite()))),
          'username' => new mfValidatorName(), // @TODO define min max + messages
            'picture'=>new mfValidatorFile(array(
                                    'required'=>false,
                                    'mime_types' => 'web_images',
                                    'max_size'=>500000,
                                    'filename'=>"picture",
                                                 )
                                            )       
        ));
    }
}