<?php

class SmsBoxSettingsForm extends mfFormSite {
 
    function __construct($site) {
        parent::__construct(array(),array(),$site);
    }
   
    function configure()
    {
        $this->setValidators(array(                                
                "login"=>new mfValidatorString(array("min_length"=>1,"max_length"=>50)) ,
                "origine"=>new mfValidatorString(array("min_length"=>1,"max_length"=>15)) ,
                "pass"=>new mfValidatorString(array("min_length"=>1,"max_length"=>50)) ,                           
                "mode"=>new mfValidatorChoice(array("key"=>true,"choices"=>array("Standard"=>"Standard","Expert"=>"Expert","Reponse"=>"Response"))),             
                "type"=>new mfValidatorChoice(array("key"=>true,"choices"=>array(0=>"0",1=>"1"))),
                "debug"=>new mfValidatorChoice(array("key"=>true,"choices"=>array(0=>"0",1=>"1"))),
                "strategy"=>new mfValidatorChoice(array("key"=>true,"choices"=>array(0=>"0",1=>"1",2=>"2",3=>"3",4=>"4"))) ,
                "ips"=>new mfValidatorString(array("min_length"=>1,"max_length"=>255)) , 
                "callback"=>new mfValidatorChoice(array("key"=>true,"choices"=>array(0=>__("Non"),1=>__("Oui")))),
                "version"=>new mfValidatorChoice(array("key"=>true,"choices"=>array("1.0"=>"1.0","1.1"=>"1.1"))),
            ) 
        );
    }
}


