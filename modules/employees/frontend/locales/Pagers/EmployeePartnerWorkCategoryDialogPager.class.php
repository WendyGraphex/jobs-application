<?php


class EmployeePartnerWorkCategoryDialogPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("PartnerWorkCategory","PartnerWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getPartnerWorkCategory(); 
            $item->setI18n($items->hasPartnerWorkCategoryI18n()?$items->getPartnerWorkCategoryI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}