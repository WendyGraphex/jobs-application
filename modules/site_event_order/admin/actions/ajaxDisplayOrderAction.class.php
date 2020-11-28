<?php


class site_event_order_ajaxDisplayOrderAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {
            $messages = mfMessages::getInstance();       
            $this->order=new SiteEventOrder($request->getPostParameter('SiteEventOrder'));        
    }
    
}