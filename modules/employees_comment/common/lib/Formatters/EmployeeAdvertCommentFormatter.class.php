<?php


class EmployeeAdvertCommentFormatter extends mfFormatter {
   
    
   
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getComment()
    {
        return new mfString($this->getValue()->get('message'));
    }
    
    function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at')); 
    }
    
}

