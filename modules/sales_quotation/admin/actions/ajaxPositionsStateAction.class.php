<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleQuotationStatePositionsForm.class.php";

class sales_quotation_ajaxPositionsStateAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new SaleQuotationStatePositionsForm($request->getPostParameter('SaleQuotationStatePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('SaleQuotationStatePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('SaleQuotationStatePositions'));
        if ($this->form->isValid())
        {           
            SaleQuotationState::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialState');
        }  
        else 
        {
             //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}