<?php


class EmployerUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerUser();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}