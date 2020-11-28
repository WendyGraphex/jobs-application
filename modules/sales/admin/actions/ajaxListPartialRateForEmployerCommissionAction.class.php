<?php

require_once __DIR__."/../locales/Forms/SaleEmployerCommissionMultipleForm.class.php";

class sales_ajaxListPartialRateForEmployerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item =$request->getRequestParameter('commission',new SaleEmployerCommission($request->getPostParameter('SaleEmployerCommission'))); 
        if ($this->item->isNotLoaded())             
            return ;
        $this->form=new SaleEmployerCommissionMultipleForm($this->item,$request->getPostParameter('SaleEmployerCommissionRate'));       
    }

}
