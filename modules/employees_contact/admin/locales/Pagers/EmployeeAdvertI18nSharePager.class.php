<?php


class EmployeeAdvertI18nSharePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertI18nShare","EmployeeAdvertI18n",));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertI18nShare();     
            $item->set('advert_i18n_id',$items->getEmployeeAdvertI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}