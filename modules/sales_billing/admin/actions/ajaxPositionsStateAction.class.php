<?php

require_once dirname(__FILE__)."/../locales/Forms/SaleBillingStatePositionsForm.class.php";

class sales_billing_ajaxPositionsStateAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new SaleBillingStatePositionsForm($request->getPostParameter('SaleBillingStatePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('SaleBillingStatePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('SaleBillingStatePositions'));
        if ($this->form->isValid())
        {           
            SaleBillingState::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialState');
        }  
        else 
        {
               echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}