<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleQuotationStateViewForm.class.php";
 
class sales_quotation_ajaxViewStateI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new SaleQuotationStateViewForm();
        $this->item_i18n=new SaleQuotationStateI18n($request->getPostParameter('SaleQuotationStateI18n'));        
   }

}

