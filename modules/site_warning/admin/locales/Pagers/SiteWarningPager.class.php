<?php


class SiteWarningPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SiteWarning',
           'SiteWarningI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSiteWarning();   
           //   var_dump($item);
              $item->setI18n($items->hasSiteWarningI18n()?$items->getSiteWarningI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


