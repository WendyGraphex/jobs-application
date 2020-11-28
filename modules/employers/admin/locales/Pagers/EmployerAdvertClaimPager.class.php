<?php


class EmployerAdvertClaimPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertClaim"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertClaim();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}