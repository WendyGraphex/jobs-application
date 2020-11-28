<?php


class EmployeeAdvertClaimPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertClaim"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertClaim();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}