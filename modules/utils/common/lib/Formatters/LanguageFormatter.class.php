<?php

class LanguageFormatter extends mfString {
    
    function  getFormatted($lang=null){
        
        return new mfString(format_language($this->value,$lang));
    }
    
    function getFormattedWithLanguage()
    {
        return new mfString(format_language($this->value,$this->value));
    }
    
     function getLanguage($lang=null)
    {
        return format_language($this->value,$lang);
    }
    
    function getCode()
    {
        return new mfString($this->getValue());
    }
    
    function lower()
    {
        return $this->getCode()->lower();
    }
    
    function  getText($lang=null){
        
        return new mfString(format_language($this->value,$lang));
    }
    
    function ucfirst()
    {
        return $this->getText()->ucfirst();
    }
}
