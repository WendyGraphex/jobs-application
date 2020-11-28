<?php


class SiteEventPlaceFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getName()
    {
        return new mfString($this->getValue()->get('name'));
    }
    
    function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function getCity()
    {
        return new mfString($this->getValue()->get('city'));
    }
}
