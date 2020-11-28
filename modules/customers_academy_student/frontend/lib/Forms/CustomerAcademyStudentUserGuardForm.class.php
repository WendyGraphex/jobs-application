<?php

class CustomerAcademyStudentUserGuardForm extends mfForm {

    function configure() {       
        $this->setValidators(array(
            'username' => new mfValidatorString(),
            'password' => new mfValidatorString(),
            'remember' => new mfValidatorBoolean(array('empty_value'=>false)),
        ));
        $this->validatorSchema->setPostValidator(new CustomerAcademyStudentUserGuardValidator());
    }
    
    function getRemember()
    {
        return $this['remember']->getValue();
    }
    
    function getEventUser()
    {
        return $this->getValue('user');
    }
}