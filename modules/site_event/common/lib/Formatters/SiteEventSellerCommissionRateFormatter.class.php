<?php


class SiteEventSellerCommissionRateFormatter extends mfFormatter {
   
     
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
    
    function getFrom()
    {
        return new FloatFormatter($this->getValue()->get('from'));
    }
    
    function getTo()
    {
        return new FloatFormatter($this->getValue()->get('to'));
    }
    
    function getRate()
    {
        return new FloatFormatter($this->getValue()->get('rate'));
    }
    
     function getFix()
    {
        return new FloatFormatter($this->getValue()->get('fix'));
    }
    
    
}
