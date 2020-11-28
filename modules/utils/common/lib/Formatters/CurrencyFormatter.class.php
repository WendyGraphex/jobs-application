<?php

class CurrencyFormatter extends mfFormatter {
    
    protected $culture=null;
    
    function __construct($value,$culture=null)
    {       
        $this->culture=$culture;
        parent::__construct($value);
    }
    
    function getText($plurial=false)
    {
        return new mfString(currency_text($this->getValue(),$plurial,$this->culture));
    }        
    
    function getSymbol()
    {
        return format_currency_symbol($this->getValue());
    }
    
    
    function __toString() {
        return (string)$this->getText();
    }    
    
}
