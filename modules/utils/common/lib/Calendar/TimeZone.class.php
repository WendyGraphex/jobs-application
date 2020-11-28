<?php


class TimeZone {
    
    protected $raw=0,$dst=0;
    
    function __construct($dst,$raw) {     
        $this->raw=intval($raw);
        $this->dst=intval($dst);          
    }
    
    function getRaw()
    {
        return $this->raw;
    }
    
    function getDst()
    {
        return $this->dst;
    }
       
    function isPositif()
    {        
        return $this->dst >= 0;
    }
    
    function isNull()
    {
        return $this->dst==0;
    }
}

