<?php


class PaymentWuSettingsEngine extends PaymentSettingsEngineCore {
    
        
     function getEmployeeSettings()
    {
        return "/".$this->getMethod()->get('module')."/employee"; 
    }
}
