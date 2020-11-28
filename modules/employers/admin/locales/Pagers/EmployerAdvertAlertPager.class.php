<?php


class EmployerAdvertAlertPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertAlert"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertAlert();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}