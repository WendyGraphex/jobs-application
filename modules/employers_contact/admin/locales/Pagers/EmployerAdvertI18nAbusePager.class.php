<?php


class EmployerAdvertI18nAbusePager extends Pager {
    
      function __construct() {        
        parent::__construct(array("EmployerAdvertI18nAbuse","EmployerAdvertI18n","CustomerAbuseType","CustomerAbuseTypeI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertI18nAbuse();  
            $item->set('advert_i18n_id',$items->getEmployerAdvertI18n());
            $item->set('type_id',$items->hasCustomerAbuseType()?$items->getCustomerAbuseType():false);
              if ($items->hasCustomerAbuseTypeI18n())
                $item->getType()->setI18n($items->getCustomerAbuseTypeI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}