<?php


class EmployerControllerPager extends Pager {
    
    function __construct() {        
         parent::__construct(array("EmployerCompany","EmployerUser","EmployerContent","EmployerContentI18n"));              
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
           $item=$items->getEmployerUser();    
           $item->set('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);    
           $item->set('content',$items->hasEmployerContent()?$items->getEmployerContent():false);
           if ($item->hasContent() && $items->hasEmployerContentI18n())
               $item->getContent()->setI18n($items->getEmployerContentI18n());
           $this->items[$item->get('id')]=$item;
       }         
       
    } 
}