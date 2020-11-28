<?php


class SaleEmployerQuotationRequestForEmployerPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerQuotationRequest","Employee","EmployeeAdvert","EmployeeAdvertI18n","SaleEmployeeQuotation"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerQuotationRequest(); 
            $item->set('employee_user_id',$items->getEmployee());
            $item->set('advert_id',$items->getEmployeeAdvert());
            $item->getAdvert()->setI18n($items->getEmployeeAdvertI18n());
            $item->set('quotation_id',$items->hasSaleEmployeeQuotation()?$items->getSaleEmployeeQuotation():false);
            $this->items[$item->get('id')]=$item;                                              
       }         
       EmployerQuotationProjectRequest::getProjectRequestsForPager($this);     
    } 
}