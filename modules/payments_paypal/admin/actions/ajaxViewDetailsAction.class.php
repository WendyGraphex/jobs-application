<?php

 
class payments_paypal_ajaxViewDetailsAction extends mfAction {

           
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();      
         $this->settings = new PaymentEmployeeSettings(array('payment_employee_id'=>$request->getPostParameter('PaymentEmployee')));   
    }
    
}    