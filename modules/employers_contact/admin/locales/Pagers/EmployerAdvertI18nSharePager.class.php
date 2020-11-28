<?php


class EmployerAdvertI18nSharePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertI18nShare",'EmployerAdvertI18n'));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertI18nShare();    
              $item->set('advert_i18n_id',$items->getEmployerAdvertI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}