<?php



class EmployerAdvertSearchPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertSearch","Employee","EmployerUser","EmployerWorkCategory","EmployerWorkCategoryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertSearch();  
            $item->set('category_id',$items->hasEmployerWorkCategory()?$items->getEmployerWorkCategory():false);
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployeerUser()?$items->getEmployerUser():false);
            if ($item->hasCategory() && $items->hasEmployerWorkCategoryI18n())
                $item->getCategory()->setI18n($items->getEmployerWorkCategoryI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}