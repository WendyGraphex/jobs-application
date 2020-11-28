<?php


class SiteHelpPager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SiteHelp',
           'SiteHelpI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSiteHelp();   
           //   var_dump($item);
              $item->setI18n($items->hasSiteHelpI18n()?$items->getSiteHelpI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


