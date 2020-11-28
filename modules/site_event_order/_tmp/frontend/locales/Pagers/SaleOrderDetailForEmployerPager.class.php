<?php


class SaleOrderDetailForEmployerPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SaleOrderQuotation",
                                
            ));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSaleOrderQuotation();   
           
           
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}