<?php

class SendMessageForQuotationForm extends mfForm {
    
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
            'quotation'=>new SaleEmployeeQuotationValidator($this->getEmployerUser()),
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
        $values['sender']='EMPLOYER';
        $values['employee_user_id']=$this->getQuotation()->getEmployeeUser();
        $values['employer_user_id']=$this->getEmployerUser();
        return $values;
    }
}
