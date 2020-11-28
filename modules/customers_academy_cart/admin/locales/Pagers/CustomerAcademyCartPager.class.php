<?php


class CustomerAcademyCartPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyCart"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyCart();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}