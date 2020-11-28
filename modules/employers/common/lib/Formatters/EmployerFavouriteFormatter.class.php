<?php


class EmployerFavouriteFormatter extends mfFormatter {
   
    
     
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     
    function getText()
    {
        if ($this->getValue()->hasEmployeeUser())
          return $this->getValue()->getEmployeeUser()->getFormatter()->getUsername();
        elseif ($this->getValue()->hasEmployerUser())
           return $this->getValue()->getEmployerUser()->getFormatter()->getUsername();
        elseif ($this->getValue()->hasEmployeeAdvert())         
           return $this->getValue()->getEmployeeAdvertI18n()->getFormatter()->getTitle()->ucfirst();
        elseif ($this->getValue()->hasEmployerAdvert())
           return $this->getValue()->getEmployerAdvertI18n()->getFormatter()->getTitle()->ucfirst();         
        return "";
    }
}

