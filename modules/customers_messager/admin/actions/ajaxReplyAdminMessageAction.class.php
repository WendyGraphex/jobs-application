<?php


class customers_messager_ajaxReplyAdminMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                   
        $messages= mfMessages::getInstance();
        $this->message=new CustomerMessage($request->getPostParameter('CustomerMessage'),$this->getUSer()->getGuardUser());   
        $this->item=new CustomerMessage(null,$this->getUSer()->getGuardUser());
    }
    
   
}


