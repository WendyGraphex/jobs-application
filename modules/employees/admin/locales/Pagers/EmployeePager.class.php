<?php


class EmployeePager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("Employee"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployee();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}