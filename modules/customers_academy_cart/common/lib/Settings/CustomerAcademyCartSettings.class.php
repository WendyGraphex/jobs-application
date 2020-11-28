<?php

class CustomerAcademyCartSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'customer_academy_cart_format_reference'=>'CART-{id}',
              'customer_academy_cart_format_id'=>'0000',
              'customer_academy_cart_default_currency'=>'USD',
        ));        
    }
      
    function getDefaultCurrency()
    {
        return $this->currency=$this->currency===null?new SiteCurrency($this->get('customer_academy_cart_default_currency','USD')):$this->currency;
    }
}
