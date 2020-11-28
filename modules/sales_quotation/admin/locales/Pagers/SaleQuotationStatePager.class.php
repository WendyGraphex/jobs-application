<?php


class SaleQuotationStatePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SaleQuotationState',
           'SaleQuotationStateI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSaleQuotationState();   
           //   var_dump($item);
              $item->setI18n($items->hasSaleQuotationStateI18n()?$items->getSaleQuotationStateI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


