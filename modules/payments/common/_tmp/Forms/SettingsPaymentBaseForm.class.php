<?php

class SettingsPaymentBaseForm extends mfFormSite {

    function __construct($defaults=array(),$site=null)
    {        
        parent::__construct($defaults,array(),$site);
    }  
    
    function configure()
    {
       $this->setValidators(array(                    
           "taxe_rate"=>new mfValidatorI18nPourcentage(),
           "adder_rate"=>new mfValidatorI18nPourcentage(),
           "adder"=>new  mfValidatorI18nNumber(),
           "amount_maximum"=>new  mfValidatorI18nNumber(),
           "amount_minimum"=>new  mfValidatorI18nNumber(),
           "admin_authorized"=>new mfValidatorChoice(array("key"=>true,"choices"=>array("YES"=>"YES","NO"=>"NO"))),
       )); 
    }
}

