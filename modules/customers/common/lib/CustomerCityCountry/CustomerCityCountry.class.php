<?php


class CustomerCityCountry {
    
     public $country,$city;
              
    function __construct($parameters=array(),$country="") {       
       
        if (is_array($parameters))
        {    
            foreach($parameters as $key => $value) {
                $this->$key = $value;
            }
        }
        else
        {
             $this->country=$country;
             $this->city=$parameters;
        }    
    }
    
    function getCountry()
    {
        return $this->_country=$this->_country===null?new CountryFormatter($this->country):$this->_country;
    }
    
    function getCity()
    {
        return $this->_city=$this->_city===null?new mfString($this->city):$this->_city;
    }
    
    function __toString()
    {
        return (string)$this->getCity()->ucfirst()." - ".$this->getCountry()->getFormatted()->ucfirst();
    }
    
    function toArray()
    {
        return array('city'=>$this->getCity()->getValue(),'country'=>(string)$this->getCountry()->getCode(),'text'=>(string)$this);
    }
 
}
