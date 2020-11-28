<?php


class EmployeeGalleryEmployeeForGalleryI18nPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeGalleryEmployee","Employee"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeGalleryEmployee();   
            $item->set('employee_user_id',$items->getEmployee());      
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}
