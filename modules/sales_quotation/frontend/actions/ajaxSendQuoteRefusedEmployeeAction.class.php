<?php

   
class sales_quotation_ajaxSendQuoteRefusedEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();        
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
        if ($this->quotation->isNotLoaded())
            return ;
         $this->quotation->setRefusedByEmployee()->save();    
         
         $engine= new EmployeeSaleQuotationEmailEngine($this->quotation);
         $engine->sendRefused();
    }
    
   
}


