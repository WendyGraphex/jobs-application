<?php


class EmployeeAdvertI18nAbusePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertI18nAbuse","EmployeeAdvertI18n","CustomerAbuseType","CustomerAbuseTypeI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertI18nAbuse();  
            $item->set('advert_i18n_id',$items->getEmployeeAdvertI18n());
            $item->set('type_id',$items->hasCustomerAbuseType()?$items->getCustomerAbuseType():false);
            if ($items->hasCustomerAbuseTypeI18n())
                $item->getType()->setI18n($items->getCustomerAbuseTypeI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}