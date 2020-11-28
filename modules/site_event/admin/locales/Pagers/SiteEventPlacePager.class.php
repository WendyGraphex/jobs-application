<?php


class SiteEventPlacePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventPlace"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventPlace();             
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}