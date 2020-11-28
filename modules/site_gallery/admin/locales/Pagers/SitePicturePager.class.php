<?php


class SitePicturePager extends Pager {
    
   function __construct() {        
        parent::__construct(array('SitePicture','SitePictureI18n'));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getSitePicture();     
              $item->setI18n($items->hasSitePictureI18n()?$items->getSitePictureI18n():false);
              $this->items[$item->get('id')]=$item;                            
       }                         
    }
}
