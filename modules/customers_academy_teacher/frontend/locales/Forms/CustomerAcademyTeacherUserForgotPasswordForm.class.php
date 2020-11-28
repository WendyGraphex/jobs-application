<?php

class CustomerAcademyTeacherUserForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new CustomerAcademyTeacherUserForgotPasswordValidator());
    }
    
    
       function getUser()
    {
        return $this->getValue('user');
    }
}