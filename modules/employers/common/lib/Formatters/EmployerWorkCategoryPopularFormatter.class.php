<?php


class EmployerWorkCategoryPopularFormatter extends mfFormatter {
   
    
    
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
     
      function getLanguage()
     {
         return new LanguageFormatter($this->getValue()->get('lang'));
     }
}
