<?php

class mfFloatFormatter extends mfFloat {
    
    protected $options=array();
    
    function __construct($value=null,$options=array()) {
       $this->options=$options;     
       parent::__construct($value);
    }
    
    function getOption($name,$defaults=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$defaults;
    }
    
    function getOptions()
    {
        return $this->options;
    }
    
   function setCurrency($currency)
   {
      $this->options['currency']=$currency;    
      return $this;
   }
    
     function __toString() {
         return (string)$this->getText();
     }
            
   
   function getText($format="#")
    {
        return format_number($this->getValue(),$this->getOption('format',$format));
    }                
    
    function getPourcentage($precision=2)
    {
        return format_pourcentage($this->getValue(),$this->getOption('pourcentage_precision',$precision));
    }           
    
    function getFilesize($unit='symbol')
    {
        return format_size($this->getValue(),$this->getOption('filesize_unit',$unit));
    } 
                  
    
    function getAmount($format="#.00")
    {
        return format_currency($this->getValue(),$this->getOption('currency','EUR'),$this->getOption('amount_format',$format));
    }          
        
    function output($format="%f")
    {               
        if (strpos($format,'+')!==false && !$this->isPositif())                
            $format=str_replace("+","",$format);                       
        return sprintf($format,$this->getValue());
    }
    
    
     function getChoices($format='[0]no result|[1]one result|(1,Inf]%s results',$format_number="#")
    {       
        return format_number_choice($this->getOption('choices',$format),format_number($this->getValue(),$this->getOption('format',$format_number)),$this->getValue());
    }
    
   
   
}
