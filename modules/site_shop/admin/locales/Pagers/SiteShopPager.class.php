<?php


class SiteShopPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SiteShop',
           'SiteShopI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSiteShop();   
           //   var_dump($item);
              $item->setI18n($items->hasSiteShopI18n()?$items->getSiteShopI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


