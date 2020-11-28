<?php


class site_event_cart_ajaxSelectQuantityToCartAction extends mfAction {
    
   function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->site_event= new SiteEvent($request->getPostParameter('SiteEvent'));  
        //$this->form= new SelectQuantityToCartForm();
    }
    
}


