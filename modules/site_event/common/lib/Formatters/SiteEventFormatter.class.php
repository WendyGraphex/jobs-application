<?php


class SiteEventFormatter extends mfFormatter {
   
    
    
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
      function getInAt()
    {
        return new DateFormatter($this->getValue()->get('in_at'));
    }
    
    function getOutAt()
    {
        return new DateFormatter($this->getValue()->get('out_at'));
    }
    
    function getPrice()
    {
          return new FloatFormatter($this->getValue()->get('price')); 
    }
    
    function getQuantity()
    {
          return new IntegerFormatter($this->getValue()->get('quantity')); 
    }
    
     function getAvailableQuantity()
    {
          return new IntegerFormatter($this->getValue()->get('available_quantity')); 
    }
    
    function getCountry()
    {
          return new CountryFormatter($this->getValue()->get('country')); 
    }
    
     function getPublishedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('published_at'));
    }
    
     function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
    }
    
     function getCommittedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('committed_at'));
    }
    
    function getRange()
    {
       return new DateRangeFormatter($this->getValue()->getInAt(),$this->getValue()->getOutAt());
    }
    
     function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['event_user']= $this->getValue()->getEventUser()->getFormatter()->toArrayForEmail();     
        return $values;  
    }
}
