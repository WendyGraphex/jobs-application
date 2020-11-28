<?php

require_once __DIR__."/../locales/Forms/SiteCurrencyViewForm.class.php";
 
class site_currency_ajaxViewCurrencyAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();
        $this->form = new SiteCurrencyViewForm();
        $this->item=new SiteCurrency($request->getPostParameter('SiteCurrency'));          
   }

}

