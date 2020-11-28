<?php


class employers_messager_ajaxViewMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->item=new CustomerEmployerMessage($request->getPostParameter('EmployerMessage'),$this->getUser()->getGuardUser());
        if (!$this->item->isSender())
           $this->item->read();
    }
    
   
}


