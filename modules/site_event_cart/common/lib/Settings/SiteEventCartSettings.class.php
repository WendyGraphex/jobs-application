<?php

class SiteEventCartSettings extends SiteSettings {
        
    
     function getDefaults()
    {
        parent::getDefaults();         
        $this->add(array( 
              'site_event_cart_format_reference'=>'EVTCART-{id}',
              'site_event_cart_format_number'=>'0000',
              'site_event_cart_default_currency'=>'USD',
        ));        
    }
      
    function getDefaultCurrency()
    {
        return $this->currency=$this->currency===null?new SiteCurrency($this->get('site_event_cart_default_currency','USD')):$this->currency;
    }
}
