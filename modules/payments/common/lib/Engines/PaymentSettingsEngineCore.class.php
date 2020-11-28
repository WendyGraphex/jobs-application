<?php


class PaymentSettingsEngineCore {
    
    protected $method=null;
    
    function __construct(PaymentMethod $method) {
        $this->method=$method;
    }    
    
    function getMethod()
    {
        return $this->method;
    }
    
    function hasEmployeeSettings()
    {
        return (boolean)$this->getEmployeeSettings();
    }
    
     function getEmployeeSettings()
    {
        return false; 
    }
    
    function isPayable()
    {
        return true;
    }
}
