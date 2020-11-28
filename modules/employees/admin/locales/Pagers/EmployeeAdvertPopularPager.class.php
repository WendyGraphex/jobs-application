<?php


class EmployeeAdvertPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertPopular","EmployeeAdvertI18n","Employee","EmployerUser","EmployeeAdvert"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertPopular();   
            $item->set('advert_id',$items->getEmployeeAdvert());
            $item->getAdvert()->setI18n($items->getEmployeeAdvertI18n());
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}