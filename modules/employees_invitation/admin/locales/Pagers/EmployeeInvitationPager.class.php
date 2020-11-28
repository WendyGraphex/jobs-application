<?php


class EmployeeInvitationPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeInvitation"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeInvitation();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}