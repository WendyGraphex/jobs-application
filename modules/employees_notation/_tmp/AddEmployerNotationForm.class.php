<?php

class AddEmployerNotationForm extends mfForm {
    
    protected $employee_user=null;
    
    function __construct(Employee $employee_user,$defaults = array(), $options = array()) {
        $this->employee_user=$employee_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployeeUser()
    {
        return $this->employee_user;
    }
    
    function configure()
    {
        $this->setValidators(array(
            'employer_user_id'=>new EmployerValidator(),
            'advert_i18n_id'=>new EmployeeAdvertI18nValidator(),
        ));
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    
    function check($validator,$values)
    {
          if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values; 
         if (EmployeeWork::getWorkForEmployeeAdvertI18nAndEmployerUser($values['advert_i18n_id'],$values['employer_user_id'],$this->getEmployeeUser()))         
                 return $values;         
         throw new mfValidatorErrorSchema($validator,array('employee_user_id'=>new mfValidatorError($this->employer_user_id,__('Employer is invalid.'))));
    }     
    
    function getEmployerUser()
    {
        return $this['employer_user_id']->getValue();
    }
    
    function getEmployeeAdvertI18n()
    {
        return $this['advert_i18n_id']->getValue();
    }
}

