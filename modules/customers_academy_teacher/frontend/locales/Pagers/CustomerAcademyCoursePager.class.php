<?php


class CustomerAcademyCoursePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyCourseI18n"));  
        
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyCourseI18n();                       
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}