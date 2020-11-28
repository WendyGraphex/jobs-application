<?php


class PaymentZelleSettingsEngine extends PaymentSettingsEngineCore {
    
        
     function getEmployeeSettings()
    {
        return "/".$this->getMethod()->get('module')."/employee"; 
    }
}
