<?php


class customers_messager_ajaxViewAdminMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();          
      $this->item=new CustomerMessage($request->getPostParameter('CustomerMessage'),$this->getUSer()->getGuardUser());        
      $this->item->read();
    }
}
