<?php


class EmployerAdvertSearchPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertSearch","EmployerWorkCategory","EmployerWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertSearch();  
            $item->set('category_id',$items->hasEmployerWorkCategory()?$items->getEmployerWorkCategory():false);  
            if ($item->hasCategory())
                $item->getCategory()->setI18n($items->hasEmployerWorkCategoryI18n()?$items->getEmployerWorkCategoryI18n():false);  
            $this->items[$item->get('id')]=$item;                                               
       }         
    } 
}