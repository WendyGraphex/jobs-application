<?php


class EmployerQuotationRequestPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerQuotationRequest","Employee","EmployerUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerQuotationRequest();    
            $item->set('employer_user_id',$items->getEmployerUser());
            $item->set('employer_user_id',$items->getEmployee());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}