<?php

require_once __DIR__."/../locales/Forms/SaleEmployeeCommissionMultipleForm.class.php";

class sales_ajaxListPartialRateForEmployeeCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item =$request->getRequestParameter('commission',new SaleEmployeeCommission($request->getPostParameter('SaleEmployeeCommission'))); 
        if ($this->item->isNotLoaded())             
            return ;
        $this->form=new SaleEmployeeCommissionMultipleForm($this->item,$request->getPostParameter('SaleEmployeeCommissionRate'));       
    }

}
