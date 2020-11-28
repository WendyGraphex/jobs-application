<?php


class EmployerGalleryPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerGallery","EmployerGalleryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerGallery();      
            $item->setI18n($items->hasEmployerGalleryI18n()?$items->getEmployerGalleryI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}