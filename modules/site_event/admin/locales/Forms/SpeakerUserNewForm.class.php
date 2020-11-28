<?php

class SiteEventSpeakerUserNewForm extends UserBaseForm {
    
     protected $user=null;
            
     function __construct($user, $defaults = array(), $site = null) {
         $this->user=$user;
         parent::__construct($user->getLanguage(), $defaults, $site);
     }
     
     function getUser()
     {
         return $this->user;
     }
     
     function configure() {     
        parent::configure();            
        $this->setValidator('password',new mfValidatorString(array('required'=>false)));
        $this->setValidator('repassword',new mfValidatorString(array('required'=>false)));       
        unset($this['id'],$this['picture']);
        $this->validatorSchema->setPostValidator(new mfValidatorSchemaCompare('password', mfValidatorSchemaCompare::EQUAL, 'repassword',array(),array("invalid"=>__("password and repassword must be equal."))));
        if ($this->getDefault('password'))
            $this->repassword->setOption('required',true);           
    }
        
}