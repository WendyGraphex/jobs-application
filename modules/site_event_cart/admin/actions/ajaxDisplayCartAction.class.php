<?php

class site_event_cart_ajaxDisplayCartAction extends mfAction {
    
        function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();                
          $this->cart= new SiteEventCart($request->getPostParameter('SiteEventCart'));        
     
    }
}
