<?php


class EmployerAlertPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployerAlert","EmployerUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAlert();  
            $item->set('employer_user_id',$items->getEmployerUser());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}