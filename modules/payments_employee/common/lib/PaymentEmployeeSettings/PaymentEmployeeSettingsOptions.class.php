<?php

class PaymentEmployeeSettingsOptions extends mfArray {
    
    
    
     function __construct($data = null) {
         parent::__construct(json_decode($data,true));
     }
    
    
     
     public  function __call($method,$args) 
    {                
            if (preg_match('~^(get|has|set)([A-Z])(.*)$~', $method, $matches)) {          
            $property = strtolower($matches[2]) . $matches[3];         
         //   echo $property;
            if ($matches[1]=='has')
               return isset($this->collection[$property]);            
            switch($matches[1]) {                
                case 'get':                    
                    return $this->collection[$property];               
                case 'set':                                  
                    return $this->collection[$property]=$args[0];     
                default:
                    throw new mfException('class '.get_class($this).' => Method ' . $method . ' not exists.');
            }
          }  
          throw new mfException('Options => Method ' . $method . ' not exists.');
    }   
}
