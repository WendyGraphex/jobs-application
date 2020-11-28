<?php


class SaleEmployerCommissionFormatter extends mfFormatter {
   
     function getName()
    {
        return new mfString($this->getValue()->get('name'));
    }
    
     function getStartedAt()
    {
        return new DateFormatter($this->getValue()->get('started_at'));
    }
    
    function getExpiredAt()
    {
        return new DateFormatter($this->getValue()->get('expired_at'));
    }            
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getNumberOfRates()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_rates'));
    }
    
    
}
