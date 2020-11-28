<?php


class CmsPagePager extends Pager {
    
   function __construct() {        
        parent::__construct(array('CmsPage','CmsPageI18n'));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                 
              $item=$items->getCmsPage();                              
              $item->set('i18n',($items->hasCmsPageI18n()?$items->getCmsPageI18n():null));                                                                                        
              $this->items[$item->get('id')]=$item;                            
       }         
    }
}