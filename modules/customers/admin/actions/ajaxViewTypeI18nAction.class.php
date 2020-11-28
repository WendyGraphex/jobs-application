<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerClaimTypeViewForm.class.php";
 
class customers_ajaxViewTypeI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerClaimTypeViewForm();
        $this->item_i18n=new CustomerClaimTypeI18n($request->getPostParameter('CustomerClaimTypeI18n'));        
   }

}

