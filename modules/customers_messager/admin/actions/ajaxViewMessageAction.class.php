<?php


class customers_messager_ajaxViewMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();          
      $this->item=new CustomerMessage($request->getPostParameter('CustomerMessage'));        
    //  $this->item->read();
    }
}
