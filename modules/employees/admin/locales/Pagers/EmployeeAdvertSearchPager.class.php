<?php


class EmployeeAdvertSearchPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertSearch","Employee","EmployerUser","EmployeeWorkCategory","EmployeeWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertSearch();  
            $item->set('category_id',$items->hasEmployeeWorkCategory()?$items->getEmployeeWorkCategory():false);
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployeerUser()?$items->getEmployerUser():false);
            if ($item->hasCategory() && $items->hasEmployeeWorkCategoryI18n())
                $item->getCategory()->setI18n($items->getEmployeeWorkCategoryI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}