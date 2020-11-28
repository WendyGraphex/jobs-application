<?php


class SiteCityPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SiteCity',
           'SiteCityI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSiteCity();   
           //   var_dump($item);
              $item->setI18n($items->hasSiteCityI18n()?$items->getSiteCityI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


