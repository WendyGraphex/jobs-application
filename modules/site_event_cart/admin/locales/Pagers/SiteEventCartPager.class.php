<?php


class SiteEventCartPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventCart"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventCart();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}