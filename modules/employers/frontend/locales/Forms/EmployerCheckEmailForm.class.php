<?php


class EmployerCheckEmailForm extends mfForm {
    
    
    function configure()
    {       
        $this->setValidators(array(
            'email'=>new mfValidatorEmail(array('trim'=>true)),           
        ));    
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $user=new EmployerUser(array('email'=>$values['email']));    
        if ($user->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('email'=>new mfValidatorError($this->email,__('Email already exists.'))));
        return $values;
    }
}


