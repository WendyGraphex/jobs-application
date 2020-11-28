<?php


class SiteEventOrderPaymentFormatter extends mfFormatter {
     
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
    
    function getNumberOfEvents()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_events'));
    }
    
    function getNumberOfItems()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_items'));
    }
    
    function getNumberOfPayments()
    {
        return new IntegerFormatter($this->getValue()->get('number_of_payments'));
    }
    
    function getLanguage()
    {
       return new LanguageFormatter($this->getValue()->get('lang'));  
    }
    
    function getCountry()
    {
        return new CountryFormatter($this->getValue()->get('country'));
    }
    
    function getCommissionWithTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithTax());
    }
    
     function getCommissionWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getCommissionWithoutTax());
    }
    
     function getGlobalSalePriceWithTax()
    {
        return new FloatFormatter($this->getValue()->getGlobalSalePriceWithTax());
    }
    
     function getGlobalSalePriceWithoutTax()
    {
        return new FloatFormatter($this->getValue()->getGlobalSalePriceWithoutTax());
    }
    
     function getDatedAt()
    {
         return new DateFormatter($this->getValue()->get('dated_at'));
    }
    
     function getPaymentSalePriceWithTax()
     {
           return new FloatFormatter($this->getValue()->getPaymentSalePriceWithTax());
     }
     
     function getPaymentSalePriceWithoutTax()
     {
           return new FloatFormatter($this->getValue()->getPaymentSalePriceWithoutTax());
     }         
          
     function getGeneralPriceWithoutTax()
     {
        return new FloatFormatter($this->getValue()->getGeneralPriceWithoutTax());
     }
        
     function getGeneralSalePriceWithTax()
     {
        return new FloatFormatter($this->getValue()->getGeneralSalePriceWithTax());
     } 
     
     
     function toArrayForPdf()
     {
         $values=array();
         foreach (array(
                'dated_at'=>array('DatedAt'=>array('Formats')),
                'created_at'=>array('CreatedAt'=>array('DateAndTimeFormats')),
                'total_sale_price_with_tax'=>array('TotalSalePriceWithTax'=>array('Amount')),
                'global_sale_price_with_tax'=>array('GlobalSalePriceWithTax'=>array('Amount')),
                'general_sale_price_with_tax'=>array('GeneralSalePriceWithTax'=>array('Amount')),
                'payment_sale_price_with_tax'=>array('PaymentSalePriceWithTax'=>array('Amount')),
                'commission_with_tax'=>array('CommissionWithoutTax'=>array('Amount')),
         ) as $field => $options)
         {
            $method="get".ucfirst(key($options)); 
            $parameters=current($options);
            $formatter="get".ucfirst($parameters[0]);
              if ($parameters[1])
                $values[$field]=$this->$method()->$formatter($parameters[1]);
            else
               $values[$field]=$this->$method()->$formatter(); 
         }   
         foreach (array('reference','id') as $field)
             $values[$field]=$this->getValue()->get($field);
         //$values['events']=$this->getValue()->getOrderQuotations()->toArrayForPdf();
         return $values;
     }
     
     
         function toArrayForEmail()
    {       
        $values=$this->getValue()->toArray();         
        $values['event_user']= $this->getValue()->getEventUser()->getFormatter()->toArrayForEmail();     
        return $values;  
    }
}
