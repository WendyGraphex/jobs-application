<?php


class EmployeeAlertPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployeeAlert","Employee"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAlert();        
            $item->set('employee_user_id',$items->getEmployee());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}