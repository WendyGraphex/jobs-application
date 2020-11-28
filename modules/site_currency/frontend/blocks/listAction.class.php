<?php

 
class site_currency_listActionComponent extends mfActionComponent {

    
    
    function execute(mfWebRequest $request) {
        
        $this->tpl=$this->getParameter('tpl','default');
        $this->currencies=SiteCurrencyUtils::getCurrencies();
        $this->currency_active=$this->getUser()->getStorage()->read('currency',new SiteCurrency('USD'));
        
    }
    
}    