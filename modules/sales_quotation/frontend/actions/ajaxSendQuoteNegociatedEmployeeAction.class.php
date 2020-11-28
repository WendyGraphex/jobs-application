<?php

require_once __DIR__."/../locales/Forms/SendQuoteNegociatedEmployeeForm.class.php";

class sales_quotation_ajaxSendQuoteNegociatedEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
            $this->forwardTo401Action ();
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
        if ($this->quotation->isNotLoaded())
            return ;
        $form=new SendQuoteNegociatedEmployeeForm();
        $form->bind($request->getPostParameter('SaleEmployeeQuotationNegociated'));
        if ($form->isValid())
        {          
            $this->quotation->history();
            $this->quotation->add($form->getValues());
            $this->quotation->setNegociatedByEmployee();          
            $this->quotation->save();
            
            $engine= new EmployeeSaleQuotationEmailEngine($this->quotation);
            /*$engine->sendAccepted();*/
            return ;
        }    
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        $response['errors']=$form->getErrorSchema()->getCodes();         
        return $response;      
    }
    
   
}

