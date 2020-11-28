<?php


class EmployeeAlertPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployeeAlert"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAlert();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}