<?php

class CultureFormatter extends mfString {
    
    function __construct($str="")
    {
        parent::__construct($str);
        $tmp=explode('_',$str);
        $this->language=new LanguageFormatter($tmp[0]);
        $this->country=new CountryFormatter($tmp[1]?$tmp[1]:$tmp[0]);       
    }
    
    function getCountry()
    {
        return $this->country;
    }
    
    function getLanguage()
    {
        return $this->language;
    }
    
    function __toString() {
        return (string)$this->getText();
    }
    
    
     function  getText($separator=" - "){
        
        if ($this->getValue())
            return (string)$this->getLanguage()->getText()->ucfirst().$separator.(string)$this->getCountry()->getText()->ucfirst();
        return "";
    }
}
