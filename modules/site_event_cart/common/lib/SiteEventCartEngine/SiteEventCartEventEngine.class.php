<?php

class SiteEventCartEventEngine   {
     
    protected $cart_event=null;
    
    function __construct(SiteEventCartEvent $cart_event) {            
        $this->cart_event=$cart_event;
    }
    
    function getCartEvent()
    {
        return $this->cart_event;
    }
    
    
    function process()
    {               
        // manage currency
       // $this->getCartEvent()->set('tax_id',$this->getCartEvent()->getEvent()->getTax());
        $this->getCartEvent()->set('sale_price_with_tax',$this->getCartEvent()->getEvent()->get('price'));     
        $this->getCartEvent()->set('total_sale_price_with_tax',$this->getCartEvent()->getSalePriceWithTax() * $this->getCartEvent()->getQuantity());
        $this->getCartEvent()->set('total_sale_price_without_tax',$this->getCartEvent()->getSalePriceWithoutTax() * $this->getCartEvent()->getQuantity());                                                   
        return $this;
    }
     
}
