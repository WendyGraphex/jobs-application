<?php


class CustomerAcademyStudentUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyStudentUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyStudentUser();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}