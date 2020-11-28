<?php


class EmployeeAdvertCityBundling {
    
     function __construct($parameters=array()) {
         ;
     }
    
     
      function getCountry()
    {
        return $this->_country=$this->_country===null?new CountryFormatter($this->country):$this->_country;
    }
       
    function getCity()
    {
        return $this->_city=$this->_city===null?new mfString($this->city):$this->_city;
    }
    
    function getNumberOfAdverts()
    {
        return $this->_number_of_adverts=$this->_number_of_adverts===null?new FloatFormatter($this->number_of_adverts):$this->_number_of_adverts;
    }
    
    
    function getI18nAdverts()
    {
        return $this->i18n_adverts=$this->i18n_adverts===null?new EmployeeAdvertI18nCollection():$this->i18n_adverts;
    }
}
