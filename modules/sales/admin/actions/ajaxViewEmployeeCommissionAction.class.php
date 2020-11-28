<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleEmployeeCommissionViewForm.class.php";
 
class sales_ajaxViewEmployeeCommissionAction extends mfAction {
                 
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();      
        $this->item = new SaleEmployeeCommission($request->getPostParameter('SaleEmployeeCommission')); 
        $this->form = new SaleEmployeeCommissionViewForm();              
    }

}
