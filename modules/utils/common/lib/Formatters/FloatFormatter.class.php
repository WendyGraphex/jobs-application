<?php

class FloatFormatter extends mfFloat {
    
     function __construct($value=null,$currency='USD') {
       $this->currency=$currency;
       parent::__construct($value);
    }
    
   function setCurrency($currency)
   {
      $this->currency=$currency;    
      return $this;
   }
    
     function __toString() {
         return (string)$this->getText();
     }
            
   
   function getText($format="#")
    {
        return format_number($this->getValue(),$format);
    }                
    
    function getPourcentage($precision=2)
    {
        return format_pourcentage($this->getValue(),$precision);
    }           
    
    function getFilesize($unit='symbol')
    {
        return format_size($this->getValue(),$unit);
    } 
                  
    
    function getAmount($format="#.00")
    {
        return format_currency($this->getValue(),$this->currency,$format);
    }          
        
    function output($format="%f")
    {               
        if (strpos($format,'+')!==false && !$this->isPositif())                
            $format=str_replace("+","",$format);                       
        return sprintf($format,$this->getValue());
    }
    
    
     function getChoices($format='[0]no result|[1]one result|(1,Inf]%s results')
    {
        return format_number_choice($format,$this->getValue(),$this->getValue());
    }
   
}
