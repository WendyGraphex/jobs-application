<?php


class EmployerUserForCompanyPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerUser","EmployerCompany"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerUser();  
            $item->set('company_id',$items->getEmployerCompany());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}