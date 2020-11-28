<?php


class EmployerAdvertAlertFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
      function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
      function getMobile()
    {
        return new mfString($this->getValue()->get('mobile'));
    } 
    
     function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    } 
    
   
}
