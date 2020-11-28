<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleBillingStateViewForm.class.php";
 
class sales_billing_ajaxViewStateI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SaleBillingStateViewForm();
        $this->item_i18n=new SaleBillingStateI18n($request->getPostParameter('SaleBillingStateI18n'));        
   }

}

