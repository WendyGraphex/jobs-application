<?php

class DeleteProductToCartForm extends mfForm {
    
    protected $cart=null;
    
     function __construct(Cart $cart,$defaults = array(), $options = array()) {
         $this->cart=$cart;
         parent::__construct($defaults, $options);
     }
     
     function getCart()
     {
         return $this->cart;
     }
     
    function configure()
    {
        $this->setValidators(array(
            'id'=>new CartProductValidator($this->getCart())
        ));
    }        
     
    function getCartProduct()
    {
        return $this['id']->getValue();
    }
}
