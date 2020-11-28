<?php


class SiteEventSpeakerUserFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getFirstname()
    {
        return new mfString($this->getValue()->get('firstname'));
    }
    
     function getLastname()
    {
        return new mfString($this->getValue()->get('lastname'));
    }
    
      function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    }
    
        function getMobile()
    {
        return new mfString($this->getValue()->get('mobile'));
    }
    
      function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function getName()
    {
        return new mfString($this->getFirstname()->ucfirst()." ".$this->getlastname()->ucfirst());
    }
}
