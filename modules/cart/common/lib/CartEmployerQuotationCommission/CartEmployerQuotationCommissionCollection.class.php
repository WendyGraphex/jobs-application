<?php


 
class CartEmployerQuotationCommissionCollection extends mfObjectCollection3 {
     
    
    function getTotalCommissionWithTax()
     {
         if ($this->total_commission_with_tax===null)
         {
             foreach ($this as $item)
                $this->total_commission_with_tax+=$item->getPriceWithTax(); 
         }    
         return $this->total_commission_with_tax;
     }
     
     function getTotalCommissionWithoutTax()
     {
        if ($this->total_commission_without_tax===null)
        {
             foreach ($this as $item)
                $this->total_commission_without_tax+=$item->getPriceWithoutTax();  
        }  
        return $this->total_commission_without_tax;
     }
}
