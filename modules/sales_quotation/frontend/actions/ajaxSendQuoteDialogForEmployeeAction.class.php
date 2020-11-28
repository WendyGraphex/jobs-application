<?php
 
class sales_quotation_ajaxSendQuoteDialogForEmployeeAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {           
        $this->max_characters=500;
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $this->item=new EmployerQuotationProjectRequest($request->getPostParameter('EmployeeProjectRequest'),$this->getUser()->getGuardUser());     
        if ($this->item->isNotLoaded())
           $this->forwardTo401Action (); 
    }
    
   
}


