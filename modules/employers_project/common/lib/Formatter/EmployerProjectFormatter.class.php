<?php


class EmployerProjectFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getNumberOfLanguages()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_languages'));
    } 
       
     function getNumberOfDocuments()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_documents'));
    } 
    
    function getNumberOfShares()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_shares'));
    } 
       
     function getBudget()
    {
        return new FloatFormatter($this->getValue()->get('budget'),'USD');
    }
    
     function getName()
    {
        return new mfString($this->getValue()->get('name'));
    }
}
