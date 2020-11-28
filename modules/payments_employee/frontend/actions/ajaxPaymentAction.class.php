<?php


class payments_employee_ajaxPaymentAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployee())          
             $this->forwardTo401Action();
        
      }
   
}

