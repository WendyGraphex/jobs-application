<?php


class CustomerRegistrationPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerRegistration"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerRegistration();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}