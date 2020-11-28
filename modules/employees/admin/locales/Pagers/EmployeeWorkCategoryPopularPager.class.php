<?php


class EmployeeWorkCategoryPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeWorkCategoryPopular","EmployeeWorkCategoryI18n","Employee","EmployerUser","EmployeeWorkCategory"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeWorkCategoryPopular();   
            $item->set('category_id',$items->getEmployeeWorkCategory());
            $item->getCategory()->setI18n($items->getEmployeeWorkCategoryI18n());
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}