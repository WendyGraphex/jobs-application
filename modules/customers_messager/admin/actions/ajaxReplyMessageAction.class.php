<?php


class customers_messager_ajaxReplyMessageAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {                   
        $messages= mfMessages::getInstance();
        $this->message=new CustomerMessage($request->getPostParameter('CustomerMessage'));   
        $this->item=new CustomerMessage(null,$this->getUSer()->getGuardUser());
        
    }
    
   
}


