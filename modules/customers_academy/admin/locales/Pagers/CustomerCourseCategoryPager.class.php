<?php


class CustomerCourseCategoryPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerCourseCategory","CustomerCourseCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerCourseCategory(); 
            $item->setI18n($items->hasCustomerCourseCategoryI18n()?$items->getCustomerCourseCategoryI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}