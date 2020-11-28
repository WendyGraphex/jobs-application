<?php


class EmployerContactPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerContact"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerContact();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}