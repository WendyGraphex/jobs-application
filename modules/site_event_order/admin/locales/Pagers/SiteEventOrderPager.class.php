<?php


class SiteEventOrderPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventOrder"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventOrder();  
       /*     $item->set('employer_user_id',$items->getEmployerUser());
            if ($item->hasEmployerCOmpany())
                $item->getEmployerUser()->set('company_id',$items->getEmployerCompany());                        
            $item->set('method_id',$items->hasPaymentMethod()?$items->getPaymentMethod():false);*/
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}