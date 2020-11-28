<?php


class EmployerCityGalleryPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerCityGallery","EmployerCityGalleryI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerCityGallery();      
            $item->setI18n($items->hasEmployerCityGalleryI18n()?$items->getEmployerCityGalleryI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}