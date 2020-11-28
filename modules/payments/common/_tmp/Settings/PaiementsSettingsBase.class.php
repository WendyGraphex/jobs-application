<?php
 

class paymentsSettingsBase extends mfSettingsBase {      
       
     function __construct($data=null,$site=null)
     {
         parent::__construct($data,null,'frontend',$site);
     } 
      
     function getDefaults()
     {   
         $this->data=array(
                        "display_payment_cost"=>"NO",
                        "amount_maximum"=>10000,
                        "amount_minimum"=>0,
                        "adder"=>0,       // Fixed value
                        "adder_rate"=>0,  // % of total cart price                 
                        "taxe_rate"=>0.196,
                        "admin_authorized"=>"NO"  // Admin interface authorized
              );        
     }
         
         
}
