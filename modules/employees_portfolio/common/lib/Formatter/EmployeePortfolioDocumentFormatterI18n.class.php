<?php


class EmployeePortfolioDocumentFormatterI18n extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    
    function getFile()
    {
        return new IntegerFormatter($this->getValue()->get('filesize'));
    }
    
    function getTitle()
    {
        return new IntegerFormatter($this->getValue()->get('title'));
    }
   
   
}
