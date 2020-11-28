<?php


class EmployeeFavouritePager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployeeFavourite"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeFavourite();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}