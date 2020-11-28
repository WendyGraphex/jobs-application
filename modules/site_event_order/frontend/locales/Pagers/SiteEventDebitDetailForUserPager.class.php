<?php


class SiteEventDebitDetailForUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventOrderEvent",
                                
            ));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventOrderEvent();   
           
           
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}