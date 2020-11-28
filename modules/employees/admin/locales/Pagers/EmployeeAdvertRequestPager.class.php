<?php


class EmployeeAdvertRequestPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertRequest"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertRequest();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}