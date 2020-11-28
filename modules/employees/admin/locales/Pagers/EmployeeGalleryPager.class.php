<?php


class EmployeeGalleryPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeGallery","EmployeeGalleryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeGallery();      
            $item->setI18n($items->hasEmployeeGalleryI18n()?$items->getEmployeeGalleryI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}