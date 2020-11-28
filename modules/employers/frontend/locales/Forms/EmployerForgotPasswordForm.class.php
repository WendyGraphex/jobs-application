<?php

class EmployerForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new EmployerUserForgotPasswordValidator());
    }
    
    
       function getEmployerUser()
    {
        return $this->getValue('user');
    }
}