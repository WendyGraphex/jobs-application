<?php


class SiteEventPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array(
           'SiteEvent',
           'SiteEventI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                            
          // echo "<pre>"; var_dump($items);
              $item=$items->getSiteEvent();             
              $item->setI18n($items->hasSiteEventI18n()?$items->getSiteEventI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }             
    }
   
}
