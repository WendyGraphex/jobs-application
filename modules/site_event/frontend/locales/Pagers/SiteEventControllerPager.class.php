<?php


class SiteEventControllerPager extends Pager2 {
    
   
    function __construct() {                           
         parent::__construct(array("SiteEvent","SiteEventI18n"));                   
    }
    
    protected function fetchObjects($db)
    {            
       while ($items = $db->fetchObjects()) 
       {                                      
            $item=$items->getSiteEventI18n();           
           // if (!$this->getAdverts()->hasItemByKey($items->getEmployerAdvert()->get('id')))          
            $item->set('event_id',$items->getSiteEvent());           
            $this->items[$item->get('id')]=$item;               
       }                       
    } 
       
     
}