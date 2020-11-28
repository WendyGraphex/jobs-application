<?php

class EmployerPostAJobForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(EmployerUser $employer_user,$defaults = array(), $options = array()) {
        $this->employer_user=$employer_user;
        parent::__construct($defaults, $options);
    }
    
    function hasEmployerUser()
    {
        if ($this->employer_user)
            return $this->getEmployerUser()->isLoaded();
        return false;
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
        
    
    function configure()
    {
        $this->setValidators(array(
                'type'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>array('private'=>__('Individual'),'professional'=>__('Business')),'empty_value'=>'private')),
                'gender'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
                'firstname' => new mfValidatorString(),                 
                'lastname' => new mfValidatorString(), 
                'username' => new mfValidatorString(array('min_length'=>8)), 
                'email' => new mfValidatorEmail(),      
                'password'=> new mfValidatorString(), 
        ));       
        if (!$this->getDefault('password'))
            $this->password->getOption('required',false);
        if ($this->hasEmployerUser())
            unset($this['email'],$this['password']);
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $user=new EmployerUser(array('email'=>$values['email']));    
        if ($user->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('email'=>new mfValidatorError($this->email,__('Account already exists.'))));
        return $values;
    }
}
