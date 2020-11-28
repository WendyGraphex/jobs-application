<?php

class CountryFormatter extends mfString {
    
    function __construct($str="")
    {
        parent::__construct(strtoupper($str));
    }
    
    function getCountry($lang=null)
    {
        return format_country($this->getValue(),$lang);
    }
    
     function  getFormatted($lang=null){
        
        return new mfString(format_country($this->getValue(),$lang));
    }
    
    function __toString() {
        return (string)$this->getFormatted();
    }
    
    function getCode()
    {
        return new mfString($this->getValue());
    }
    
    function lower()
    {
        return strtolower($this->getValue());
    }
    
     function  getText($lang=null){
        
        return new mfString(format_country($this->getValue(),$lang));
    }
}
