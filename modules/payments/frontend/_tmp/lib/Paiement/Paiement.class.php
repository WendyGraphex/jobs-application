<?php

class payment extends paymentBase {
    
    function getComponentInformation()
    {
        return "/".$this->get('module')."/InformationDisplay";
    }
    
    function isChecked()
    {                 
        if ($this->getpaymentEngine()->getCart()->haspayment())
        {                 
            if ($this->getpaymentEngine()->getCart()->get('payment_id')==$this->get('id'))
                return true;
            return false;
        }  
        return $this->isFirst();
    }
    
    function getCountries()
    {
        if ($this->isNotLoaded())
            return array();                
        if ($this->isCached("countries"))      
            return $this->readCache("countries");        
        $countries=parent::getCountries();
        $this->writeCache('countries', $countries);
        return $countries;
    }
    
     function getCurrencies()
    {         
        if ($this->isNotLoaded())
            return array();                
        if ($this->isCached("currencies"))      
            return $this->readCache("currencies");        
        $currencies=parent::getCurrencies();
        $this->writeCache('currencies', $currencies);
        return $currencies;
    }
    
   
}
