<?php


 
class CartQuotationCollection extends mfObjectCollection3 {
     
    
    function init()
    {
        $this->total_sale_price_with_tax=null;
        $this->total_sale_price_without_tax=null;     
        return $this;
    }
   
    /* function loadProductsAndTaxes()
     {
         $products_ids=new mfArray();
         foreach ($this as $item)
           $products_ids[]=$item->get('product_id');
         $products=ProductUtils::getProductsAndTaxesFromSelection($products_ids);
         foreach ($this as $item)        
             $item->set('product_id',$products->getItemByKey($item->get('product_id')));         
     }*/
     
     
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
     
 
      function deleteQuotation(CartQuotation $cart_quotation)
     {
        foreach ($this->getKeys() as $index)
        {
            if ($this->getItemByKey($index)->get('id') == $cart_quotation->get('id'))
               unset($this[$index]);
        }  
        return $this;
     } 
}
