<?php


class EmployerUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerUser","EmployerCompany"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerUser();    
            $item->get('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}