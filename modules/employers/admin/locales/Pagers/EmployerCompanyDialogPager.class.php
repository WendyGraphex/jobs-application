<?php


class EmployerCompanyDialogPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerCompany"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerCompany();                                   
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}