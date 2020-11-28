<?php

   
class sales_quotation_ajaxSendQuoteAcceptedEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();        
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
        if ($this->quotation->isNotLoaded())
            return ;
         $this->quotation->setAcceptedByEmployee()->save();   
         
           $engine= new EmployeeSaleQuotationEmailEngine($this->quotation);
         $engine->sendAccepted(); 
    }
    
   
}


