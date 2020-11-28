<?php


class cart_AddCartProductBtnActionComponent extends mfActionComponent {

  
    
    function execute(mfWebRequest $request)
    {                         
          $this->cart=$this->getUser()->getStorage()->read('cart');      
    } 
    
    
}
