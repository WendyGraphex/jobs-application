<?php


class employees_messager_ajaxReplyMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->message=new CustomerEmployeeMessage($request->getPostParameter('EmployeeMessage'),$this->getUser()->getGuardUser());   
        $this->item=new CustomerEmployeeMessage();
    }
    
   
}


