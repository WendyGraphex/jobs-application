<?php


class EmployerCompanyPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerCompanyPopular","EmployerCompany","Employee","EmployerUser"));        
    }
    
    protected function fetchObjects($db)
    {                    
       while ($items = $db->fetchObjects()) 
       {                                        
            $item=$items->getEmployerCompanyPopular();   
            $item->set('company_id',$items->getEmployerCompany());          
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);           
            $this->items[$item->get('id')]=$item;                         
       }         
    }  
}