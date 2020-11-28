<?php


 
class SaleOrderQuotationCollection extends mfObjectCollection3 {
     
    
    
     
     function getTotalSalePriceWithTax()
     {
         if ($this->total_sale_price_with_tax===null)
         {
             foreach ($this as $item)
                $this->total_sale_price_with_tax+=$item->getTotalSalePriceWithTax(); 
         }    
         return $this->total_sale_price_with_tax;
     }
     
     function getTotalSalePriceWithoutTax()
     {
        if ($this->total_sale_price_without_tax===null)
        {
             foreach ($this as $item)
                $this->total_sale_price_without_tax+=$item->getTotalSalePriceWithoutTax();  
        }  
        return $this->total_sale_price_without_tax;
     }
     
  
     function toArrayForPdf()
     {
         $values =array();
         foreach ($this as $item)
            $values[]=$item->getFormatter()->toArrayForPdf();         
         return $values;
     }
}
