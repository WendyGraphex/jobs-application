<?php


class employers_messager_ajaxDialogMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->item=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
    }
    
   
}


