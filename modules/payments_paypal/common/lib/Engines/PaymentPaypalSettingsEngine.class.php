<?php


class PaymentPaypalSettingsEngine extends PaymentSettingsEngineCore {
    
    
    
     function getEmployeeSettings()
    {
        return "/".$this->getMethod()->get('module')."/employee"; 
    }
    
    function isPayable()
    {
        return false;
    }
}
