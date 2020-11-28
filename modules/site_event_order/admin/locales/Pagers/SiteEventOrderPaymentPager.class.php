<?php


class SiteEventOrderPaymentPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("SiteEventOrderPayment","SiteEvent","SiteEventI18n","SiteEventUser"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getSiteEventOrderPayment();
            $item->set('event_id',$items->getSiteEvent());
            $item->set('event_user_id',$items->getSiteEventUser());
            $item->getEvent()->setI18n($items->hasSiteEventI18n()?$items->getSiteEventI18n():false);
       /*     $item->set('employer_user_id',$items->getEmployerUser());
            if ($item->hasEmployerCOmpany())
                $item->getEmployerUser()->set('company_id',$items->getEmployerCompany());                        
            $item->set('method_id',$items->hasPaymentMethod()?$items->getPaymentMethod():false);*/
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}