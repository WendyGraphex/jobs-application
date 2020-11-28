<?php

   
class sales_quotation_ajaxSendQuoteScheduleEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action ();
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());        
        if ($this->quotation->isNotLoaded())
            return ;
        $this->quotation->setScheduleNeededByEmployer()->save();    
        
         $engine= new EmployerSaleQuotationEmailEngine($this->quotation);
         $engine->sendSchedule();
    }
    
   
}


