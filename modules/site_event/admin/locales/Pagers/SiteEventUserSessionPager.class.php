<?php


class SiteEventUserSessionPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("SiteEventUser","SiteEventUserSession"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getSiteEventUserSession();    
            $item->set('user_id',$items->getSiteEventUser());
            $this->items[]=$item;                         
       }         
    }
    
}