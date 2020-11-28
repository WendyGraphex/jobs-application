<?php

class EmployerUserGuardForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'username' => new mfValidatorString(),
            'password' => new mfValidatorString(),
            'remember' => new mfValidatorBoolean(array('empty_value'=>false)),
        ));
        $this->validatorSchema->setPostValidator(new EmployerUserGuardValidator());
    }
    
    function getRemember()
    {
        return $this['remember']->getValue();
    }
    
    function getEmployerUser()
    {
        return $this->getValue('user');
    }
}