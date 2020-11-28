<?php

class PaymentForm extends mfForm {
    
    protected $payment=null;
    
    function configure()
    {
        $this->setValidators(array(
            "id"=>new mfValidatorInteger()          
        ));
        if (OrdersSettings::load()->get('terms_checked')=='YES')
            $this->setValidator('terms', new mfValidatorChoice(array("choices"=>array("YES"))));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'checkpayment'))));
    }
    
    function checkpayment($validator,$values)
    {
       if ($this->getValidatorSchema()->getErrorSchema()->hasErrors())
           return $values;
       $this->payment=new payment($values['id']);
       if ($this->payment->isNotLoaded())
          throw new mfValidatorErrorSchema($validator,array("id"=>new mfValidatorError($this->validatorSchema['id'],__("this payment is unknown."))));         
       return $values;
    } 
    
    function getpayment()
    {
        return $this->payment;
    }
}
