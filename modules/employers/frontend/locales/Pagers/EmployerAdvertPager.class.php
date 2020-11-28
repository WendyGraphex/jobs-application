<?php


class EmployerAdvertPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvert","EmployerAdvertI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvert();   
            if (!isset($this->items[$item->get('id')]))
                $this->items[$item->get('id')]=$item->setAdvertsI18n(new EmployerAdvertI18nCollection()); 
            $this->items[$item->get('id')]->getAdvertsI18n()->add($items->getEmployerAdvertI18n()->set('advert_id',$this->items[$item->get('id')]));                                               
       }         
    } 
}