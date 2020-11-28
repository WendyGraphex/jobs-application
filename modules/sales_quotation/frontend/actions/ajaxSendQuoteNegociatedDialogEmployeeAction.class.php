<?php

   
class sales_quotation_ajaxSendQuoteNegociatedDialogEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) { 
        $this->max_characters=500;
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
          if ($this->quotation->isNotLoaded())
            $this->forward404();
    }
    
   
}


