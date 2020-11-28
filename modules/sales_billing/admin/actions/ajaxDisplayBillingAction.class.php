<?php


class sales_billing_ajaxDisplayBillingAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {
            $messages = mfMessages::getInstance();       
            $this->billing=new SaleBilling($request->getPostParameter('SaleBilling'));        
    }
    
}