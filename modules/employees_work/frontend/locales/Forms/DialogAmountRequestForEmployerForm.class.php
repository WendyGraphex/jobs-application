<?php

class DialogAmountRequestForEmployerForm extends mfForm {
    
    protected $payment_request =null;
    
    function __construct(EmployeeWorkPaymentRequest $payment_request,$defaults = array(), $options = array()) {
        $this->payment_request =$payment_request;
        parent::__construct($defaults, $options);
    }
    
    function getRequest()
    {
        return $this->payment_request;
    }
    
    function configure() {
        $this->setValidators(array(            
            'amount'=>new mfValidatorI18nNumber(array('max'=>$this->getRequest()->getRestOfTotalPriceWithTax())),
        ));
    }
    
    function getAmount()
    {
        return $this['amount']->getValue();
    }
    
    
}
