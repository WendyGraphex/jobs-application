<?php

class SendMessageForQuotationForm extends mfForm {
    
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
            'quotation'=>new SaleEmployeeQuotationValidator($this->getEmployeeUser()),
            'message'=>new mfValidatorString(),
            'subject'=>new mfValidatorString(),
        ));
    }   
    
   function  getQuotation()
   {
       return $this['quotation']->getValue();
   }    
    
    function getValues()
    {
        $values=parent::getValues();
        $values['sender']='EMPLOYEE';
        $values['employer_user_id']=$this->getQuotation()->getEmployerUser();
        $values['employee_user_id']=$this->getEmployeeUser();
        return $values;
    }
}
