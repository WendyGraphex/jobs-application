<?php

class payments_employee_ajaxProcessToCreditAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee() || !($this->payment=$this->getUser()->getStorage()->read('payment')))             
            $this->forwardTo401Action();        
        $messages = mfMessages::getInstance();                       
        $this->default = new PaymentEmployeeSettings($this->getUser()->getGuardUser());
    }
    
   
}

