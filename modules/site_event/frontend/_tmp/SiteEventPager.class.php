<?php


class EmployeeAdvertPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvert","EmployeeAdvertI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvert();   
            if (!isset($this->items[$item->get('id')]))
                $this->items[$item->get('id')]=$item->setAdvertsI18n(new EmployeeAdvertI18nCollection()); 
            $this->items[$item->get('id')]->getAdvertsI18n()->add($items->getEmployeeAdvertI18n());                                               
       }         
    } 
}