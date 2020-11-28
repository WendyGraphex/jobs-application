<?php


class SiteEventUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventUser();             
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}