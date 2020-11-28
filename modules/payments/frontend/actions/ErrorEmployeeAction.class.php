<?php


class payments_ErrorEmployeeAction extends mfAction {
    
    function execute(mfWebRequest $request) {       

        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();           
        if (!$request->getRequestParameter('payment',false))
            $this->forward404();      
        $this->payment_employee_user=$request->getRequestParameter('payment');
        $this->user=$this->getUser();                
    }
}


