<?php

require_once __DIR__."/../locales/Forms/CustomerViewForm.class.php";

class customers_registration_ajaxViewCustomerAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->item=new CustomerRegistration(array('id'=>$request->getPostParameter('Customer')));      
        $this->user=$this->getUser();       
        $this->form= new CustomerViewForm(array(),$this->getUser());
    }
    
}
