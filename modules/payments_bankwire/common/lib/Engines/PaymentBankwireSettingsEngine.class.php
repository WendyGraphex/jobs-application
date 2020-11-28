<?php


class PaymentBankwireSettingsEngine extends PaymentSettingsEngineCore {
    
        
     function getEmployeeSettings()
    {
        return "/".$this->getMethod()->get('module')."/employee"; 
    }
}
