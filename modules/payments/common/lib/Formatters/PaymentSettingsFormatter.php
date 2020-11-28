<?php


class PaymentSettingsFormatter extends mfFormatter {
 
    function getMaximumAmount()
    {
        return new FloatFormatter($this->getValue()->get('amount_maximum'));
    }
    
     function getMinimumAmount()
    {
        return new FloatFormatter($this->getValue()->get('amount_minimum'));
    }
    
      function getAdder()
    {
        return new FloatFormatter($this->getValue()->get('adder'));
    }
    
     function getAdderRate()
    {
        return new FloatFormatter($this->getValue()->get('adder_rate'));
    }
    
      function getTaxRate()
    {
        return new FloatFormatter($this->getValue()->get('tax_rate'));
    }
            
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
        
    
}

