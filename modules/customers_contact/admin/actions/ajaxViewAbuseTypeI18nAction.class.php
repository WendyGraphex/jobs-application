<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAbuseTypeViewForm.class.php";
 
class customers_contact_ajaxViewAbuseTypeI18nAction extends mfAction {
    
    
        
    function execute(mfWebRequest $request) {              
     
        $messages = mfMessages::getInstance();
        $this->form = new CustomerAbuseTypeViewForm();
        $this->item_i18n=new CustomerAbuseTypeI18n($request->getPostParameter('CustomerAbuseTypeI18n'));        
   }

}

