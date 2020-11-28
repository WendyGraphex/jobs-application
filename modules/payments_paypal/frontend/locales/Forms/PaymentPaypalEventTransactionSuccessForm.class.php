<?php


class PaymentPaypalEventTransactionSuccessForm extends mfForm {
    
    protected $payment_event_user=null,$employer_user=null;
    
    function __construct(SiteEventUser $event_user,$defaults = array(), $options = array()) {
        $this->event_user=$event_user;
        parent::__construct($defaults, $options);
    }
    
    function getEventUser()
    {
        return $this->event_user;
    }
    
    
    function configure() {                   
        $this->setValidators(array(
             "paymentId"=>new mfValidatorString(array('required'=>false)),
             "token"=>new mfValidatorString(),
             "PayerID"=>new mfValidatorString(array('required'=>false)),                                       
        ));                     
        $this->setOption('disabledCSRF', true);
         $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'checkData'))));
    }
    

    function checkData($validator,$values)
    {
        if ($this->hasErrors())
            return $values;
        $settings=new PaypalSettings();                    
       if ($settings->getPayerID()!=$values['PayerID'])
             throw new mfValidatorError($this->PayerID,__('PayerID is invalid'),array());            
        $this->payment_event_user=new PaymentDebitEventUser(array('reference'=>$values['token'],'payer'=>$values['PayerID']),$this->getEventUser());         
        if ($this->payment_event_user->isNotLoaded())
            throw new mfValidatorError($this->token,__('Token is invalid'),array());                           
        $this->payment_event_user->set('transaction_reference',$values['paymentId']);                        
        return $values;
    }
    
    function getPaymentID()
    {
        return $this['paymentId']->getValue();
    }
    
    function getPayerID()
    {
        return $this['PayerID']->getValue();
    }
        
    
    function getPaymentEventUser()
    {
        return $this->payment_event_user;
    } 
}


