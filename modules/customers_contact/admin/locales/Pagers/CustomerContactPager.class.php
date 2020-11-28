<?php


class CustomerContactPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerContact"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerContact();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}