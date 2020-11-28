<?php


class SiteCountryPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("SiteCountry"));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getSiteCountry();               
              $this->items[$item->get('id')]=$item;                            
       }                         
    }
}
