<?php

class PaypalSettings extends SiteSettings {
    
      
     function getDefaults()
     {   
         parent::getDefaults();
         $this->set('paypal_settings_mode',null);
     }
    
     
  /*   function getClientID()
     {
         return "AQeSDKfIJjpQhwIGYxOcQJU2qcG0n_IKuO0O0eNX_udQFZ76wr1SgXqNKzTk4ANogls_GeCLCING96qi";
     }
     
     function getClientSecret()
     {
         return "EM0nkefMEKRpHfwBUG5M5uv6MywUtlak4HaE8_sbNS6OXkcSQIfmauj9Aj7geWnuP0JJcsmGIp8CSDry";
     }
     
     
     function getPayerID()
     {
         return "SSZDVUZNYP32G";
     } */
     
     
    /* function getProdClientID()
     {
         return "AQeSDKfIJjpQhwIGYxOcQJU2qcG0n_IKuO0O0eNX_udQFZ76wr1SgXqNKzTk4ANogls_GeCLCING96qi";
     }
     
     function getProdClientSecret()
     {
         return "EM0nkefMEKRpHfwBUG5M5uv6MywUtlak4HaE8_sbNS6OXkcSQIfmauj9Aj7geWnuP0JJcsmGIp8CSDry";
     }
     
     
     function getProdPayerID()
     {
         return "SSZDVUZNYP32G";
     }*/
     
     function getMode()
     {
         return $this->_mode= $this->_mode ===null?new PaymentPaypalSettings($this->get('paypal_settings_mode')): $this->_mode;
     }
     
      function getClientID()
     {
         return $this->getMode()->get('client');
     }
     
     function getClientSecret()
     {
         return $this->getMode()->get('secret');
     }
     
     function getPayerID()
     {
         return $this->getMode()->get('payer');
     } 
     
     
}
