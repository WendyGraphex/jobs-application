<?php


class EmployeeWorkPaymentRequestFormatter extends mfFormatter {
   
            
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
      function getDate()
    {
        return new DateFormatter($this->getValue()->get('date'));
    }
    
    function getTotalPriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithoutTax()); 
    }   
    
    function getTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithTax());
    }
    
    function getPreviousTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getPreviousTotalPriceWithTax());
    }
    
     function getRefusedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('refused_at'));
    }
    
       function getAcceptedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('accepted_at'));
    }
    
     function getConfirmedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('confirmed_at'));
    }        
    
     function getRequestedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('requested_at'));
    }
    
    function getRestOfTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getRestOfTotalPriceWithTax());
    }
    
    function toArrayForEmail()
    {
        $values=$this->getValue()->toArray(array('reference'));
        
        $values['employee']=$this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();
        $values['employer']=$this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
        $values['total_price_with_tax']=$this->getTotalPriceWithTax()->getAmount();
        $values['previous_total_price_with_tax']=$this->getPreviousTotalPriceWithTax()->getAmount();
        $values['refused_url']=url_to('employees_work_refused_request',[],"frontend","")."?payment=".$this->getValue()->get('reference');
        return $values;
    }
}

