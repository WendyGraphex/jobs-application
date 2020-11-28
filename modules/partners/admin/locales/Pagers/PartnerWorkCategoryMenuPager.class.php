<?php


class PartnerWorkCategoryMenuPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("PartnerWorkCategoryMenu","PartnerWorkCategoryMenuI18n","PartnerWorkCategory","PartnerWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getPartnerWorkCategoryMenu(); 
            $item->setI18n($items->hasPartnerWorkCategoryMenuI18n()?$items->getPartnerWorkCategoryMenuI18n():false);
            $item->set('category_id',$items->hasPartnerWorkCategory()?$items->getPartnerWorkCategory():false);
            if ($item->hasCategory())
              $item->getCategory()->setI18n($items->hasPartnerWorkCategoryI18n()?$items->getPartnerWorkCategoryI18n():false);  
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}