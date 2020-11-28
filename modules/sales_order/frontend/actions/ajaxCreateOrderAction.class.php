<?php


class sales_order_ajaxCreateOrderAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        if ($this->getUser()->isAuthenticated() && !$this->getUser()->isEmployerUser())          
             $this->forwardTo401Action();
        if (!$this->cart=$this->getUser()->getStorage()->read('cart'))
             $this->forwardTo401Action();          
         $this->order=new SaleOrder($this->cart);
         $this->order->create();
        // var_dump($this->order);
          $this->getUSer()->getStorage()->remove('cart');
      }
   
}

