<?php


class PaymentPaypalTransactionSuccessForm extends mfForm {
    
    protected $payment_employer_user=null,$employer_user=null;
    
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
        $this->payment_employer_user=new PaymentEmployerUser(array('reference'=>$values['token'],'payer'=>$values['PayerID']),$this->getEmployerUser());         
        if ($this->payment_employer_user->isNotLoaded())
            throw new mfValidatorError($this->token,__('Token is invalid'),array());                           
        $this->payment_employer_user->set('transaction_reference',$values['paymentId']);                        
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
        
    
    function getPaymentEmployerUser()
    {
        return $this->payment_employer_user;
    } 
}


