<?php


class SiteGalleryPager extends Pager {
    
   function __construct() {        
        parent::__construct(array('SiteGallery','SiteGalleryI18n'));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getSiteGallery();     
              $item->setI18n($items->hasSiteGalleryI18n()?$items->getSiteGalleryI18n():false);
              $this->items[$item->get('id')]=$item;                            
       }                         
    }
}
