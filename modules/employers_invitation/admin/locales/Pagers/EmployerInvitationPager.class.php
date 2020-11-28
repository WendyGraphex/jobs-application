<?php


class EmployerInvitationPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerInvitation"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerInvitation();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}