<?php

class cart_ajaxDisplayCartAction extends mfAction {
    
        function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();                
          $this->cart= new Cart($request->getPostParameter('Cart'));        
     
    }
}
