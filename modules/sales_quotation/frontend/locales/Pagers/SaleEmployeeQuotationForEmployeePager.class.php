<?php


class SaleEmployeeQuotationForEmployeePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SaleEmployeeQuotation",
                                  "EmployeeAdvert", "EmployeeAdvertI18n",
                                  "EmployerAdvert", "EmployerAdvertI18n",
                                  "EmployerUser","EmployerProject"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSaleEmployeeQuotation(); 
            $item->set('employer_user_id',$items->getEmployerUser());
            $item->set('project_id',$items->hasEmployerProject()?$items->getEmployerProject():false);
            $item->set('employer_advert_id',$items->hasEmployerAdvert()?$items->getEmployerAdvert():false);
             if ($item->hasEmployerAdvert() && $items->hasEmployerAdvertI18n())
                $item->getEmployerAdvert()->setI18n($items->getEmployerAdvertI18n());
             $item->set('employee_advert_id',$items->hasEmployeeAdvert()?$items->getEmployeeAdvert():false);
            if ($item->hasEmployeeAdvert() && $items->hasEmployeeAdvertI18n())
                $item->getEmployeeAdvert()->setI18n($items->getEmployeeAdvertI18n()); 
            $this->items[$item->get('id')]=$item;                                              
       }         
    } 
}