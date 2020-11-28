<?php

require_once __DIR__."/../Validators/UserForgotPasswordValidator.class.php";

class UserForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new UserForgotPasswordValidator());
    }
}
