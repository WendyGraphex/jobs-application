<?php


class EmployerAdvertRequestPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertRequest"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertRequest();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}