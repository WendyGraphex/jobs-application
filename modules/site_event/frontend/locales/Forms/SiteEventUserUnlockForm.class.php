<?php

class SiteEventUserUnlockForm extends mfForm {
    
    protected $user=null;
    
    function __construct(SiteEventUser $employer_user,$defaults = array(), $options = array()) {
        $this->user=$employer_user;
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
        if ($this->user->checkUnlock($values['password']))
            return $values;       
        $this->getErrorSchema()->addError(new mfValidatorError($validator,'invalid',__("Account is invalid.")),'password');          
        return $values;
    }
}
