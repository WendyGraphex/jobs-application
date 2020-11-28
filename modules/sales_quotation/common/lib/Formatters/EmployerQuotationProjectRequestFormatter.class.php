<?php


class EmployerQuotationProjectRequestFormatter extends mfFormatter {
   
  
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getQuotedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('quoted_at'));
    }
}


