<?php


class MyCartsPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("Cart"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCart();                                
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}