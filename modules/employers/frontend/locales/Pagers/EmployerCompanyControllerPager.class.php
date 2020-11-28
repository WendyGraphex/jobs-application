<?php


class EmployerCompanyControllerPager extends Pager {
    
    function __construct() {        
         parent::__construct(array("EmployerCompany","EmployerCompanyContent","EmployerCompanyContentI18n"));              
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
           $item=$items->getEmployerCompanyContentI18n();             
           $item->set('content_id',$items->getEmployerCompanyContent());
           $item->getContent()->set('company_id',$items->getEmployerCompany());
           $this->items[$item->get('id')]=$item;
       }         
       
    } 
}