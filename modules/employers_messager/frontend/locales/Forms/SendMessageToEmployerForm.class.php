<?php

class SendMessageToEmployerForm extends mfForm {
    
    protected $employee_user=null;
    
    function __construct(Employee $employee_user,$defaults = array(), $options = array()) {
        $this->employee_user=$employee_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function configure() {
        $this->setValidators(array(
            'employer'=>new EmployerValidator(),
            'message'=>new mfValidatorString(),
            'subject'=>new mfValidatorString(),
        ));
    }        
    
    function getValues()
    {
        $values=parent::getValues();
        $values['sender']='EMPLOYEE';
        $values['employee_user_id']=$this->getEmployeeUser();
        $values['employer_user_id']=$this['employer']->getValue();       
        return $values;
    }
}
