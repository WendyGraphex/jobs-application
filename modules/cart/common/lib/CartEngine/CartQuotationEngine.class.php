<?php

class CartQuotationEngine   {
     
    protected $cart_quotation=null;
    
    function __construct(CartQuotation $cart_quotation) {            
        $this->cart_quotation=$cart_quotation;
    }
    
    function getCartQuotation()
    {
        return $this->cart_quotation;
    }
    
    
    function process()
    {               
        // manage currency
      //  $this->getCartQuotation()->set('tax_id',$this->getCartQuotation()->getQuotation()->getTax());
        $this->getCartQuotation()->set('sale_price_with_tax',$this->getCartQuotation()->getQuotation()->get('price'));
      //  $this->getCartQuotation()->set('sale_price_without_tax',$this->getCartProduct()->getProduct()->get('sale_price_without_tax'));
        $this->getCartQuotation()->set('total_sale_price_with_tax',$this->getCartQuotation()->getSalePriceWithTax() * $this->getCartQuotation()->getQuantity());
      //  $this->getCartQuotation()->set('total_sale_price_without_tax',$this->getCartQuotation()->getSalePriceWithoutTax() * $this->getCartQuotation()->getQuantity());                                                   
        return $this;
    }
     
}
