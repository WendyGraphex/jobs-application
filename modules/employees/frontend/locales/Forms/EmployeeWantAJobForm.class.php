<?php

class EmployeeWantAJobForm extends mfForm {
    
    protected $employee_user=null;
    
    function __construct($employee_user,$defaults = array(), $options = array()) {
        $this->employee_user=$employee_user;
        parent::__construct($defaults, $options);
    }
    
    
     function hasEmployeeUser()
    {
        if ($this->employee_user)
            return $this->getEmployeeUser()->isLoaded();
        return false;
    }
        
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function configure()
    {
        $this->setValidators(array(
                'type'=>new mfValidatorChoice(array('key'=>true,'required'=>false,'choices'=>array('private'=>__('Private'),'professional'=>__('Professional')),'empty_value'=>'private')),
                'gender'=>new mfValidatorChoice(array("choices"=>array("Mrs"=>"Mrs","Mr"=>"Mr","Ms"=>"Ms"),"key"=>true)),
                'firstname' => new mfValidatorString(),                 
                'lastname' => new mfValidatorString(), 
                'username' => new mfValidatorString(array('min_length'=>8)), 
                'email' => new mfValidatorEmail(),      
                'password'=> new mfValidatorString(), 
        ));
        if (!$this->getDefault('password'))
            $this->password->getOption('required',false);
        if ($this->hasEmployeeUser())
            unset($this['email'],$this['password']);
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
     function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;           
        $user=new Employee(array('email'=>$values['email']));    
        if ($user->isLoaded())
            throw new mfValidatorErrorSchema($validator,array('email'=>new mfValidatorError($this->email,__('Account already exists.'))));
        return $values;
    }
}
