<?php

class SiteEventUserForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new SiteEventUserForgotPasswordValidator());
    }
    
    
       function getUser()
    {
        return $this->getValue('user');
    }
}