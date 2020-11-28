<?php

class EmployeeForgotPasswordForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'email' => new mfValidatorEmail() //array(),array("required"=>__("This field is required"))),
        ));        
       $this->validatorSchema->setPostValidator(new EmployeeForgotPasswordValidator());
    }
    
    
       function getEmployee()
    {
        return $this->getValue('user');
    }
}