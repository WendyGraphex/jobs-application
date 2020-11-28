<?php


class EmployerLanguageLevelFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     
    
}
