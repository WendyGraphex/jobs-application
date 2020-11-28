<?php

class EmployeeUserGuardForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'username' => new mfValidatorString(),
            'password' => new mfValidatorString(),
            'remember' => new mfValidatorBoolean(array('empty_value'=>false)),
        ));
        $this->validatorSchema->setPostValidator(new EmployeeUserGuardValidator());
    }
    
    function getRemember()
    {
        return $this['remember']->getValue();
    }
    
    function getEmployeeUser()
    {
        return $this->getValue('user');
    }
}