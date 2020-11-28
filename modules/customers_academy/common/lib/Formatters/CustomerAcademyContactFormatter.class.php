<?php


class CustomerAcademyContactFormatter extends mfFormatter {
   
    
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
     
     function getGender()
    {
        return format_gender($this->getValue()->get('gender'));
    }
    
     function getLastname()
    {
        return new mfString($this->getValue()->get('lastname'));
    }
    
    function getFirstname()
    {        
        return new mfString($this->getValue()->get('firstname'));
    }
    
      function getPhone()
    {
        return new mfString($this->getValue()->get('phone'));
    }
}
