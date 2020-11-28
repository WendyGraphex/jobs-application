<?php


class CustomerAcademyTeacherUserPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyTeacherUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyTeacherUser();                        
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}