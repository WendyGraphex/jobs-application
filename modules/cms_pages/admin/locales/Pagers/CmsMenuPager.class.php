<?php


class CmsMenuPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CmsMenu","CmsMenuI18n","CmsPage","CmsPageI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCmsMenu(); 
            $item->setI18n($items->hasCmsMenuI18n()?$items->getCmsMenuI18n():false);
            if ($items->hasCmsPage())
            { 
                $item->set('page_id',$items->getCmsPage());
                $item->getPage()->setI18n($items->hasCmsPageI18n()?$items->getCmsPageI18n():false);
            }
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}