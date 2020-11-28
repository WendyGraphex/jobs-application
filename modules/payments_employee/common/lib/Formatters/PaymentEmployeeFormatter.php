<?php


class PaymentEmployeeFormatter extends mfFormatter {
   
            
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithTax());
    }
    
     function getTotalPriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getTotalPriceWithoutTax());
    }
    
    function getOrderTotalPriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getOrderTotalPriceWithTax());
    }
    
     function getNumberOfRequests()
    {
        return new IntegerFormatter($this->getValue()->getNumberOfRequests());
    }
    
    
    function getCommissionWithTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithTax());
    }
    
     function getCommissionWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithouTax());
    }
    
    function getAmount()
    {
        return new mfArray(array('currency'=>$this->getValue()->get('currency'),'value'=>$this->getValue()->getTotalPriceWithTax()));
    }
    
     function getGeneralPriceWithTax()
     {
           return new FloatFormatter($this->getValue()->getGeneralPriceWithTax());
     }
     
      function getGeneralPriceWithoutTax()
     {
           return new FloatFormatter($this->getValue()->getGeneralPriceWithoutTax());
     }
     
     function getPaymentPriceWithTax()
     {
           return new FloatFormatter($this->getValue()->getPaymentPriceWithTax());
     }
     
      function getPaymentPriceWithoutTax()
     {
         return new FloatFormatter($this->getValue()->getPaymentPriceWithoutTax());
     }
     
      function getGlobalPriceWithTax()
     {
           return new FloatFormatter($this->getValue()->getGlobalPriceWithTax());
     }
     
      function getGlobalPriceWithoutTax()
     {
           return new FloatFormatter($this->getValue()->getGlobalPriceWithoutTax());
     }
     
    /* function getTotalPriceCommissionWithTax()
     {
         return new FloatFormatter($this->getValue()->getTotalPriceCommissionWithTax());
     }*/
     
     
     function toArrayForEmail()
     {
         $values=$this->getValue()->toArray();
         $values['employee']=$this->getValue()->getEmployeeUser()->getFormatter()->toArrayForEmail();
         return $values;
     }
}

