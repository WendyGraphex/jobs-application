<?php

class SaleEmployeeCommissionRateForm extends SaleEmployeeCommissionRateBaseForm {
    
    
    function configure() {
         parent::configure();
         unset($this['id']);
    }
}


class SaleEmployeeCommissionMultipleForm extends mfForm {
    
    protected $commission=null;
    
    function __construct(SaleEmployeeCommission $commission,$defaults = array(), $options = array()) {
        $this->commission=$commission;
        parent::__construct($defaults, $options);
    }
    
    function getCommission()
    {
        return $this->commission;
    }
    
    function configure() {  
        if (!$this->getDefaults() && $this->getCommission()->getRates()->count()==0)
           $this->getCommission()->getRates()->push(new SaleEmployeeCommissionRate()); 
        if (!$this->getDefaults() && $this->getCommission()->getRates()->count() > 0)
        {
            $this->setDefault('rates', $this->getCommission()->getRates()->toArray());
        }    
       $this->embedFormForEach('rates',new SaleEmployeeCommissionRateForm($this->getDefault('rates')), $this->getDefaults()?count($this->getDefault('rates')):1);
       $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'reorganize'))));
    }
      
    
    function reorganize($validator,$values)
    {
        // check les from et to
        return $values;
    }
    
    function getRates()
    {
        return $this['rates']->getArray();
    }
}

