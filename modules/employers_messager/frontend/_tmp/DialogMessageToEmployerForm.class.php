<?php

class DialogMessageToEmployerForm extends mfForm {
    
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
            'subject'=>new mfValidatorString(),
        ));
    }        
       
    function getEmployerUser()
    {
        return $this['employer']->getValue();
    }
    
    function getSubject()
    {
        return $this['subject']->getValue();
    }
}
