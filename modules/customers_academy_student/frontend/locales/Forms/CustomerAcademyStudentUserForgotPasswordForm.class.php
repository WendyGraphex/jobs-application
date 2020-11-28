<?php

class CustomerAcademyStudentUserForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new CustomerAcademyStudentUserForgotPasswordValidator());
    }
    
    
       function getUser()
    {
        return $this->getValue('user');
    }
}