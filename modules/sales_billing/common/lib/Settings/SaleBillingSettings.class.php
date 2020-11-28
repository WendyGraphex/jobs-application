<?php

class SaleBillingSettings extends SiteSettings {
    
    protected $billing_model=null;
    
    function getDefaults()
    {
        parent::getDefaults();      
        $this->add(array( 
            "billing_model"=>null,
            ));
        
    }
    
    function hasSaleBillingModel()
    {
        return (boolean)$this->get('billing_model');
    }
      
    function getSaleBillingModel()
    {
        return $this->billing_model=$this->billing_model===null?new SystemModelText($this->get('billing_model')):$this->billing_model;
    }
}
