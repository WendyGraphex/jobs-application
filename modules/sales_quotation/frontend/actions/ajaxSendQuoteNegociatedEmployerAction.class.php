<?php

require_once __DIR__."/../locales/Forms/SendQuoteNegociatedEmployerForm.class.php";

class sales_quotation_ajaxSendQuoteNegociatedEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action ();
        $this->quotation=new SaleEmployeeQuotation($request->getPostParameter('SaleEmployeeQuotation'),$this->getUser()->getGuardUser());
        if ($this->quotation->isNotLoaded())
            return ;
        $this->max_characters=500;
        $form=new SendQuoteNegociatedEmployerForm();
        $form->bind($request->getPostParameter('SaleEmployeeQuotationNegociated'));
        if ($form->isValid())
        {            
            $this->quotation->history();
            $this->quotation->add($form->getValues());
            $this->quotation->setNegociatedByEmployer();          
            $this->quotation->save();
            
            $engine= new EmployerSaleQuotationEmailEngine($this->quotation);
             /*$engine->sendAccepted();*/
            return ;
        }    
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        $response['errors']=$form->getErrorSchema()->getCodes();         
        return $response;      
    }
    
   
}


