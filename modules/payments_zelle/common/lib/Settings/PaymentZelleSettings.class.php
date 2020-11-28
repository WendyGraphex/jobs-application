<?php

class PaymentZelleSettings extends PaymentMethodSettings {
    
     protected static $instance=null;    
     
     function __construct($data=null,$site=null)
     {
         parent::__construct($data,null,'frontend',$site);
     } 
      
     function getDefaults()
     {   
         
                
     }
    
     
    
}
