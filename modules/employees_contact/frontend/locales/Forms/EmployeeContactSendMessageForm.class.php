<?php

class EmployeeContactSendMessageForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'firstname'=>new mfValidatorString(),
            'lastname'=>new mfValidatorString(),
            'subject'=>new mfValidatorString(),
            'email'=>new mfValidatorEmail(),         
            'message'=>new mfValidatorString(array('min_length'=>20,'max_length'=>500)),
            'phone'=>new mfValidatorString(array('required'=>false)),
            'gender'=>new mfValidatorChoice(array("choices"=>array(''=>__("Choose type"),"Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
        ));        
    }
    
  
}
