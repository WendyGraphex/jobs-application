<?php
 
class sales_quotation_ajaxSendRequestDialogForEmployeeAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {           
        $this->max_characters=500;
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $this->item=new EmployerQuotationRequest($request->getPostParameter('EmployerQuotationRequest'),$this->getUser()->getGuardUser());     
        if ($this->item->isNotLoaded() || $this->item->hasQuotation())
            $this->forwardTo401Action (); 
    }
    
   
}


