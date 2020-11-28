<?php


class EmployerCheckUsernameForm extends mfForm {
    
    protected $user=null;
    
    function __construct($user,$defaults = array(), $options = array()) {
        if ($user->isEMployerUser())
            $this->user=$user->getGuardUser();
        parent::__construct($defaults, $options);
    }
    
    function hasUser()
    {
        return (boolean)$this->getUser();
    }
    
    function getUser()
    {
        return $this->user;
    }
    
    function configure()
    {       
        $this->setValidators(array(
            'username'=>new mfValidatorString(),           
        ));    
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values;           
        $user=new EmployerUser(array('username'=>$values['username']));    
        if ($this->hasUser())
        {    
            if ($user->isLoaded() && $user->get('id') != $this->getUser()->get('id'))
                throw new mfValidatorErrorSchema($validator,array('username'=>new mfValidatorError($this->username,__('Username already exists.'))));
        }
        else
        {
           if ($user->isLoaded())
                throw new mfValidatorErrorSchema($validator,array('username'=>new mfValidatorError($this->username,__('Username already exists.'))));  
        }    
        return $values;
    }
}


