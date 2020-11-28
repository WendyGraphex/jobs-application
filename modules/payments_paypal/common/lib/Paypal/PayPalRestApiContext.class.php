<?php

PayPalRestAutoload::register();

class PayPalRestApiContext extends \PayPal\Rest\ApiContext {
    
     function __construct() {                       
         parent::__construct(new \PayPal\Auth\OAuthTokenCredential(                 
                        $this->getSettings()->getClientID(),
                        $this->getSettings()->getClientSecret()
                ));
       $this->setConfig(
            array(
                'mode' => $this->getSettings()->getMode()->get('mode'),         
            )
        );
       /*
        *   //  'log.LogEnabled' => true,
              //  'log.FileName' => '../PayPal.log',
              //  'log.LogLevel' => 'DEBUG', // PLEASE USE `INFO` LEVEL FOR LOGGING IN LIVE ENVIRONMENTS
              //  'cache.enabled' => true,
                //'cache.FileName' => '/PaypalCache' // for determining paypal cache directory
                // 'http.CURLOPT_CONNECTTIMEOUT' => 30
                // 'http.headers.PayPal-Partner-Attribution-Id' => '123123123'
                //'log.AdapterFactory' => '\PayPal\Log\DefaultLogFactory' // Factory class implementing \PayPal\Log\PayPalLogFactory
        */
     }
     
     function getSettings()
     {
         return $this->settings=$this->settings===null?new PaypalSettings():$this->settings;
     }
     
     function getSuccessUrl()
     {
         if (mfConfig::get('mf_env')=='prod')
            return url_to("payments_success",array('payment'=>'paypal'),"frontend","");
         return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_success",array('payment'=>'paypal'),"frontend");
     }
     
     function getCancelUrl()
     {
           if (mfConfig::get('mf_env')=='prod')
                return url_to("payments_cancel",array('payment'=>'paypal'),"frontend","");
           return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_cancel",array('payment'=>'paypal'),"frontend");
     }
    
     function getReturnUrl()
     {
          if (mfConfig::get('mf_env')=='prod')
                return url_to("payments_paypal_return",array(),"frontend","");
          return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_paypal_return",array(),"frontend");
     }
     
     // Event
      function getEventSuccessUrl()
     {
         if (mfConfig::get('mf_env')=='prod')
            return url_to("payments_success",array('payment'=>'paypal'),"frontend","");
         return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_event_success",array('payment'=>'paypal'),"frontend");
     }
     
     function getEventCancelUrl()
     {
           if (mfConfig::get('mf_env')=='prod')
                return url_to("payments_event_cancel",array('payment'=>'paypal'),"frontend","");
           return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_event_cancel",array('payment'=>'paypal'),"frontend");
     }
    
     function getEventReturnUrl()
     {
          if (mfConfig::get('mf_env')=='prod')
                return url_to("payments_event_paypal_return",array(),"frontend","");
          return "https://".mfCOntext::getInstance()->getSite()->getHost().url_to("payments_event_paypal_return",array(),"frontend");
     }
}