<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteEventSellerCommissionViewForm.class.php";
 
class site_event_ajaxViewSellerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SiteEventSellerCommission($request->getPostParameter('SiteEventSellerCommission')); 
        $this->form = new SiteEventSellerCommissionViewForm();              
    }

}
