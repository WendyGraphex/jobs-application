<?php


class SaleBillingPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SaleBilling"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSaleBilling();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}