<?php


class PaymentEmployerUserFormatter extends mfFormatter {
   
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
        
    function getOrderTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getOrderTotalPriceWithTax());
    }
    
    function getPaymentPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getPaymentPriceWithTax());
    }
    
    
    function getTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithTax());
    }
    
    
     function toArrayForEmail()
     {
         $values=$this->getValue()->toArray();
         $values['employer']=$this->getValue()->getEmployerUser()->getFormatter()->toArrayForEmail();
         return $values;
     }
}

