<?php


class EmployerCityPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerCity","EmployerCityI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerCity();                                   
            $item->setI18n($items->hasEmployerCityI18n()?$items->getEmployerCityI18n():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}