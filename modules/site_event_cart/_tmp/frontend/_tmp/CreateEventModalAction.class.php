<?php

require_once __DIR__."/../locales/Forms/CartEventCreateForm.class.php";

class cart_CreateEventModalActionComponent extends mfActionComponent {
      
    function execute(mfWebRequest $request)
    {       
         if (!$this->cart=$this->getUser()->getStorage()->read('cart'))                    
              $this->cart = Cart::create($this->getUser(),$request);               
         if ($this->cart->hasEvent())
             return mfView::NONE;     
         $this->form = new CartEventCreateForm();
         $this->cart->getEvent()->add($this->form->getDefaults());
    }     
    
}

