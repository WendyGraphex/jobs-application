<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerClaimTypePositionsForm.class.php";

class customers_ajaxPositionsTypeAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new CustomerClaimTypePositionsForm($request->getPostParameter('CustomerClaimTypePositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('CustomerClaimTypePositions'))
            return ;       
        $this->form->bind($request->getPostParameter('CustomerClaimTypePositions'));
        if ($this->form->isValid())
        {           
            CustomerClaimType::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialType');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}