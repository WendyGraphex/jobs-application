<?php


class EmployerAlertPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployerAlert"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAlert();               
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}