<?php

require_once __DIR__."/../locales/Forms/SiteEventSellerCommissionMultipleForm.class.php";

class site_event_ajaxListPartialRateForSellerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item =$request->getRequestParameter('commission',new SiteEventSellerCommission($request->getPostParameter('SiteEventSellerCommission'))); 
        if ($this->item->isNotLoaded())             
            return ;
        $this->form=new SiteEventSellerCommissionMultipleForm($this->item,$request->getPostParameter('SiteEventSellerCommissionRate'));       
    }

}
