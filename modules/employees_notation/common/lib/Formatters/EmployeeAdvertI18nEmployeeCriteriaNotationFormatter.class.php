<?php


class EmployeeAdvertI18nEmployeeCriteriaNotationFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
   
    function getNotation()
    {
        return new IntegerFormatter($this->getValue()->get('notation'));
    }
   
}

