<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployerCommissionViewForm.class.php";
 
class sales_ajaxViewEmployerCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployerCommission($request->getPostParameter('SaleEmployerCommission')); 
        $this->form = new SaleEmployerCommissionViewForm();              
    }

}
