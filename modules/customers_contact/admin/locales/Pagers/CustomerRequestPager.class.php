<?php


class CustomerRequestPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerRequest"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerRequest();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}