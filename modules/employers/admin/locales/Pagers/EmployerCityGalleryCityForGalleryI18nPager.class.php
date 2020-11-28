<?php


class EmployerCityGalleryCityForGalleryI18nPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerCityGalleryCity","EmployerCity","EmployerCityI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerCityGalleryCity();   
            $item->set('city_id',$items->getEmployerCity());
            $item->getCity()->setI18n($items->hasEmployerCityI18n()?$items->getEmployerCityI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}
