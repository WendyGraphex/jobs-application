<?php


class SaleBillingQuotationFormatter extends mfFormatter {
     
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
     function getQuantity()
    {
        return new FloatFormatter($this->getValue()->getQuantity());
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
    
    
    function toArrayForPdf()
     {
         $values=array();
         foreach (array(
             'in_at'=>array('InAt'=>array('Formats')),
             'out_at'=>array('OutAt'=>array('Formats')),
             'created_at'=>array('CreatedAt'=>array('DateAndTimeFormats')),
             'total_sale_price_with_tax'=>array('TotalSalePriceWithTax'=>array('Amount')),
             'sale_price_with_tax'=>array('SalePriceWithTax'=>array('Amount')),
             'quantity'=>array('Quantity'=>array('Text')),
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
         $values['quotation']=$this->getValue()->getQuotation()->getFormatter()->toArrayForPdf();
         return $values;
     }
}
