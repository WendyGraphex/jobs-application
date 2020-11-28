<?php

class EmployerUserUnlockForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(EmployerUser $employer_user,$defaults = array(), $options = array()) {
        $this->employer_user=$employer_user;
        parent::__construct($defaults, $options);
    }
    
    function configure()
    {
        $this->setValidators(array(
            'password'=>new mfValidatorString()
        ));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->hasErrors())
            return $values;
        if ($this->employer_user->checkUnlock($values['password']))
            return $values;       
        $this->getErrorSchema()->addError(new mfValidatorError($validator,'invalid',__("Account is invalid.")),'password');          
        return $values;
    }
}
