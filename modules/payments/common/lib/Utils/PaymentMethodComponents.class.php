<?php

class PaymentMethodComponents    {
    
    protected $method=null;
    
    function __construct(PaymentMethod $method) {
        $this->method=$method;
    }
    
    function getmethod()
    {
        return $this->method;
    }
    
    function getShortContent()
    {
        return "/".$this->getMethod()->get('module')."/short";
    }
    
      function getTab()
    {
        return "/".$this->getMethod()->get('module')."/tab";
    }
    
    
    function getSettings()
    {
        return "/".$this->getMethod()->get('module')."/settings"; 
    }
    
    function getShortContentCredit()
    {
        return "/".$this->getMethod()->get('module')."/shortCredit";
    }
   
    
}