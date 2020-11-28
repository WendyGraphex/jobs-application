<?php


class CartQuotationFormatter extends mfFormatter {
     
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getSalePriceWithTax());
    }
    
     function getSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getSalePriceWithoutTax());
    }
    
    function getTotalSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalSalePriceWithTax());
    }
    
     function getTotalSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalSalePriceWithoutTax());
    }
      
     function getInAt()
    {
        return new DateFormatter($this->getValue()->get('in_at'));
    }
    
     function getOutAt()
    {
        return new DateFormatter($this->getValue()->get('out_at'));
    }
    
      function getNumberOfDays()
    {        
        return new DurationFormatter(intval($this->getValue()->get('number_of_hours')) * 3600);
    }
}
