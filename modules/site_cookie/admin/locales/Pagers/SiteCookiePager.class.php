<?php


class SiteCookiePager extends Pager {
    
   function __construct() {        
        parent::__construct(array("SiteCookie"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getSiteCookie();              
            $this->items[]=$item;                         
       }         
    }
    
}