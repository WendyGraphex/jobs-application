<?php


class EmployerAdvertPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvert","EmployerAdvertI18n","EmployerUser","EmployerCompany"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvert();   
            if (!isset($this->items[$item->get('id')]))
            {
                $item->set('employer_user_id',$items->getEmployerUser());
                $item->getEmployerUser()->set('company_id',$items->hasEmployerCompany()?$items->getEmployerCompany():false);                    
                $this->items[$item->get('id')]=$item->setAdvertsI18n(new EmployerAdvertI18nCollection()); 
            }
            $this->items[$item->get('id')]->getAdvertsI18n()->add($items->getEmployerAdvertI18n());                                               
       }         
    } 
}