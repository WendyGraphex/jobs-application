<?php


class SaleOrderForEmployerPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SaleOrder","PaymentEmployerUser",
                                //"Employee","SaleEmployeeQuotation",
                                //  "EmployeeAdvert", "EmployeeAdvertI18n",
                                //  "EmployerAdvert", "EmployerAdvertI18n",
                               //      "EmployerProject"
            ));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSaleOrder();   
            $item->set('payment_id',$items->hasPaymentEmployerUser()?$items->getPaymentEmployerUser():false);
          /*  $item->set('employee_user_id',$items->getEmployee());
            $item->set('quotation_id',$items->getSaleEmployeeQuotation());
            $item->getQuotation()->set('employer_advert_id',$items->hasEmployerAdvert()?$items->getEmployerAdvert():false);
            if ($item->getQuotation()->hasEmployerAdvert())
                $item->getQuotation()->getEmployerAdvert()->setI18n($items->getEmployerAdvertI18n());
            $item->getQuotation()->set('employee_advert_id',$items->hasEmployeeAdvert()?$items->getEmployeeAdvert():false);
            if ($item->getQuotation()->hasEmployeeAdvert())
                $item->getQuotation()->getEmployeeAdvert()->setI18n($items->getEmployeeAdvertI18n());*/
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}