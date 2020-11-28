<?php

class SmsBoxEvents  {



    static function setSettingsForForm(mfEvent $event)
    {

        if (!mfModule::isModuleInstalled('services_smsbox'))
          return ;

        $form=$event->getSubject();
        $form->addValidators(array(
                "smsbox_login"=>new mfValidatorString(array('required'=>false, "min_length"=>1,"max_length"=>50)) ,
                "smsbox_origine"=>new mfValidatorString(array('required'=>false,"min_length"=>1,"max_length"=>15)) ,
                "smsbox_pass"=>new mfValidatorString(array('required'=>false,"min_length"=>1,"max_length"=>50)) ,
                "smsbox_mode"=>new mfValidatorChoice(array('required'=>false,"key"=>true,"choices"=>array("Standard"=>"Standard","Expert"=>"Expert","Reponse"=>"Response"))),
                "smsbox_type"=>new mfValidatorChoice(array('required'=>false,"key"=>true,"choices"=>array(0=>"0",1=>"1"))),
                "smsbox_debug"=>new mfValidatorChoice(array('required'=>false,"key"=>true,"choices"=>array(0=>"0",1=>"1"))),
                "smsbox_strategy"=>new mfValidatorChoice(array('required'=>false,"key"=>true,"choices"=>array(0=>"0",1=>"1",2=>"2",3=>"3",4=>"4"))) ,
                "smsbox_ips"=>new mfValidatorString(array('required'=>false,"min_length"=>1,"max_length"=>255)) ,
                "smsbox_callback"=>new mfValidatorChoice(array("key"=>true,"choices"=>array(0=>__("Non"),1=>__("Oui")))),
                "smsbox_version"=>new mfValidatorChoice(array('required'=>false,"key"=>true,"choices"=>array("1.0"=>"1.0","1.1"=>"1.1"))),
            ));
        $form->getComponents()->set("50_00_smsbox","/services_smsbox/settings");
    }


    
}
