<?php

 
class AutomaticResponseReturnForm extends mfForm {
    
    
    function configure() {
        $this->setValidators(array(
            'data'=>new PaypalHookResponseValidator(array('assoc'=>true)),
            'key'=>new PaymentEmployerUserValidator()
        ));
        $this->setOption('disabledCSRF',true);
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));      
    }
    
    function check($validator,$values)
    {
        if ($this->validatorSchema->getErrorSchema()->hasErrors())
            return $values;           
        if (($values['key']->get('transaction_reference') == $values['data']['parent_payment']) 
            && ($values['data']['state']=='completed') 
            && ($values['key']->getTotalPriceWithTax() == $values['data']['amount']) 
            && ($values['key']->get('currency') == $values['data']['currency'])
           )
        {    
            return $values;
        }    
        throw new mfValidatorError($this->data,'invalid');        
    }
    
    
    function getPaymentEmployerUser()
    {
        return $this['key']->getValue();
    }
    
    function getTransactionFee()
    {
       return $this['data']->getValue()['transaction_fee']['value'];
    }
    
    function getTransactionFeeCurrency()
    {
       return $this['data']->getValue()['transaction_fee']['currency']; 
    }
    
}