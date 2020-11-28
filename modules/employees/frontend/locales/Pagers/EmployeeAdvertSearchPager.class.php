<?php


class EmployeeAdvertSearchPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertSearch","EmployeeWorkCategory","EmployeeWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertSearch();  
            $item->set('category_id',$items->hasEmployeeWorkCategory()?$items->getEmployeeWorkCategory():false);  
            if ($item->hasCategory())
                $item->getCategory()->setI18n($items->hasEmployeeWorkCategoryI18n()?$items->getEmployeeWorkCategoryI18n():false);  
            $this->items[$item->get('id')]=$item;                                               
       }         
    } 
}