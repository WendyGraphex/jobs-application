<?php


class CustomerContactClaimPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerContactClaim"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerContactClaim();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}