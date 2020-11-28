<?php


class EmployeeWorkFormatter extends mfFormatter {
   
            
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
     function getEndAt()
    {
        return new DateFormatter($this->getValue()->get('end_at'));
    }
    
    function getStartAt()
    {
        return new DateFormatter($this->getValue()->get('start_at'));
    }
    
     function getNumberOfDays()
    {        
        return new IntegerFormatter($this->getValue()->getNumberofHours() /24);
    }
    
     function getNumberOfPayments()
    {        
        return new IntegerFormatter($this->getValue()->getNumberOfPayments());
    }
    
     function getTotalPriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithoutTax()); 
    }   
    
    function getTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithTax());
    }
    
     function getTotalPaidWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPaidWithTax());
    }
    
     function getTotalPaidWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPaidWithoutTax());
    }
    
    function getTotalUnPaidWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalUnPaidWithTax());
    }
    
     function getTotalUnPaidWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalUnPaidWithoutTax());
    }
    
    function getTotalRequiredWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalRequiredWithTax());
    }
    
     function getTotalRequiredWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalRequiredWithoutTax());
    }
    
    function getTotalPaidAndAcceptedWithTax()
     {
        return new FloatFormatter($this->getValue()->getTotalPaidAndAcceptedWithTax());
    }
    
    
    
}

