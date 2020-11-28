<?php


class CustomerAcademyContactPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyContact"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyContact();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}