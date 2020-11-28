<?php


class EmployerFavouritePager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployerFavourite"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerFavourite();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}