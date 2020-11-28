<?php


class EmployeeControllerPager extends Pager {
    
    function __construct() {        
         parent::__construct(array("Employee","EmployeeContent","EmployeeContentI18n"));              
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
           $item=$items->getEmployee();     
           $item->set('content',$items->hasEmployeeContent()?$items->getEmployeeContent():false);
           if ($item->hasContent() && $items->hasEmployeeContentI18n())
               $item->getContent()->setI18n($items->getEmployeeContentI18n());           
           $this->items[$item->get('id')]=$item;
       }         
       
    } 
}