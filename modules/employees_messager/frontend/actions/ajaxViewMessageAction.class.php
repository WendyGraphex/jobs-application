<?php


class employees_messager_ajaxViewMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();
        $messages= mfMessages::getInstance();
        $this->item=new CustomerEmployeeMessage($request->getPostParameter('EmployeeMessage'),$this->getUser()->getGuardUser()); 
        if (!$this->item->isSender())
            $this->item->read();
    }
    
   
}


