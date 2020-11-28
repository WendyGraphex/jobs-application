<?php


class CartProductValidator extends mfValidatorString {

    protected $cart=null;
    
    function __construct(Cart $cart,$options)
    {        
        $this->cart=$cart;
        parent::__construct($options);       
    }
    
    protected function getCart()
    {
        return $this->cart;
    }
    
    protected function configure($options,$messages)
    { 
       parent::configure($options,$messages);
       $this->setOption("empty_value",null); // in case of value is null                   
    }
  
    protected function doIsValid($value) 
    {      
        $item=new CartProduct(array('id'=>$value,'cart'=>$this->getCart()));
         if ($item->isNotLoaded())        
           throw new mfValidatorError($this, 'invalid', array('value' => $value));               
        return $item;
    }

}
