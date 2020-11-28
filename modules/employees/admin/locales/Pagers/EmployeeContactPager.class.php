<?php


class EmployeeContactPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeContact"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeContact();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}