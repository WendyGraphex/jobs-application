<?php


class employees_messager_ajaxDialogMessageForRequestAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->item=new EmployerQuotationRequest($request->getPostParameter('SaleEmployerQuotationRequest'),$this->getUser()->getGuardUser());
    }
    
   
}


