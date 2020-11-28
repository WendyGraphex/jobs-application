<?php


class EmployerAdvertCommentFormatter extends mfFormatter {
   
      function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
       function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at')); 
    }
   
}

