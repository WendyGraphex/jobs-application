<?php

class PaymentMethodSettings extends mfSettings {
            
      protected static $instance=null;    
     
     function __construct($data=null,$site=null)
     {
         parent::__construct($data,null,'frontend',$site);
     } 
     
     
     function getDefaults()
     {            
         $this->add(array(
                "amount_maximum"=>10000,
                "amount_minimum"=>0,
                "adder"=>0,        
                "adder_rate"=>0,                    
                "taxe_rate"=>0.20,
         ));        
     }
    
}
