<?php


class employers_messager_ajaxReplyMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->message=new CustomerEmployerMessage($request->getPostParameter('EmployerMessage'),$this->getUser()->getGuardUser());   
        $this->item=new CustomerEmployerMessage();
    }
    
   
}


