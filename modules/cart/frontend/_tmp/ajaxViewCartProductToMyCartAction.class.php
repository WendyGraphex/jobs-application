<?php

 
class cart_ajaxViewCartProductToMyCartAction extends mfAction {
  
     
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->item=new CartProduct($request->getPostParameter('CartProduct'));      
        $this->cart=$this->item->getCart();  
        $this->product=$this->item->getProduct();  
        $this->event=$this->cart->getEvent();
       //var_dump($this->cart->getEvent());
       // var_dump($this->product);
      
             
    }
}
