<?php


class SiteEventSpeakerUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventSpeakerUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventSpeakerUser();             
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}