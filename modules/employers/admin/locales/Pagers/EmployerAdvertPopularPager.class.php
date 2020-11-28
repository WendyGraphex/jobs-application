<?php


class EmployerAdvertPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertPopular","EmployerAdvertI18n","Employee","EmployerUser","EmployerAdvert"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertPopular();   
            $item->set('advert_id',$items->getEmployerAdvert());
            $item->getAdvert()->setI18n($items->getEmployerAdvertI18n());
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}