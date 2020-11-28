<?php


class SiteClientPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("SiteClient"));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getSiteClient();               
              $this->items[$item->get('id')]=$item;                            
       }                         
    }
}
