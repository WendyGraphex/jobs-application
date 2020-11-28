<?php

class SendMessageToEmployeeForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(EmployerUser $employer_user,$defaults = array(), $options = array()) {
        $this->employer_user=$employer_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    
    function configure() {
        $this->setValidators(array(
            'employee'=>new EmployeeValidator(),
            'message'=>new mfValidatorString(),
            'subject'=>new mfValidatorString(),
        ));
    }        
    
    function getValues()
    {
        $values=parent::getValues();
        $values['sender']='EMPLOYER';
        $values['employer_user_id']=$this->getEmployerUser();
        $values['employee_user_id']=$this['employee']->getValue();       
        return $values;
    }
}
