<?php


class EmployerWorkCategoryPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerWorkCategoryPopular","EmployerWorkCategoryI18n","Employee","EmployerUser","EmployerWorkCategory"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerWorkCategoryPopular();   
            $item->set('category_id',$items->getEmployerWorkCategory());
            $item->getCategory()->setI18n($items->getEmployerWorkCategoryI18n());
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}