<?php


class SiteLanguagePager extends Pager {
    
   function __construct() {        
        parent::__construct(array("Language"));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getLanguage();               
              $this->items[$item->get('id')]=$item;                            
       }                         
    }
}
