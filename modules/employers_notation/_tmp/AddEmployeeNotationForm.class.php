<?php

class AddEmployeeNotationForm extends mfForm {
    
    protected $employer_user=null;
    
    function __construct(Employer $employer_user,$defaults = array(), $options = array()) {
        $this->employer_user=$employer_user;
        parent::__construct($defaults, $options);
    }
    
    function getEmployerUser()
    {
        return $this->employer_user;
    }
    function configure()
    {
        $this->setValidators(array(
            'employee_user_id'=>new EmployeeValidator(),
            'advert_i18n_id'=>new EmployerAdvertI18nValidator(),
        ));
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    
    function check($validator,$values)
    {
          if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
            return $values;           
         if (EmployeeWork::getWorkForEmployerAdvertI18nAndEmployeeUser($values['advert_i18n_id'],$values['employee_user_id'],$this->getEmployerUser()))         
                 return $values;         
         throw new mfValidatorErrorSchema($validator,array('employee_user_id'=>new mfValidatorError($this->employee_user_id,__('Employee is invalid.'))));
    }     
    
    function getEmployeeUser()
    {
        return $this['employee_user_id']->getValue();
    }
    
    function getAdvertI18n()
    {
        return $this['advert_i18n_id']->getValue();
    }
}
