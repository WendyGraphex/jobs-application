<?php


class site_event_order_ajaxCreateOrderAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        if (!$this->getUser()->isEventUser())          
             $this->forwardTo401Action();
        if (!$this->cart=$this->getUser()->getStorage()->read('event_cart'))
             $this->forwardTo401Action();          
         $this->order=new SiteEventOrder($this->cart);
         $this->order->create();
         
         // $this->getUser()->getStorage()->remove('event_cart');
      }
   
}

