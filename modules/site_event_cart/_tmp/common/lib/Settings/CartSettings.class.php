<?php

class CartSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'cart_format_reference'=>'CART-{id}',
              'cart_format_id'=>'0000',
              'cart_default_currency'=>'USD',
        ));        
    }
      
    function getDefaultCurrency()
    {
        return $this->currency=$this->currency===null?new SiteCurrency($this->get('cart_default_currency','USD')):$this->currency;
    }
}
