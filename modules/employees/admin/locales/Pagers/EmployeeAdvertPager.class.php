<?php


class EmployeeAdvertPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvert","EmployeeAdvertI18n","Employee",
             ));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvert();   
            if (!isset($this->items[$item->get('id')]))
            {
                $item->set('employee_user_id',$items->getEmployee());
             //   $item->getEmployeeUser()->set('company_id',$items->hasEmployeeCompany()?$items->getEmployeeCompany():false);                    
                $this->items[$item->get('id')]=$item->setAdvertsI18n(new EmployeeAdvertI18nCollection()); 
            }
            $this->items[$item->get('id')]->getAdvertsI18n()->add($items->getEmployeeAdvertI18n());                                               
       }         
    } 
}
