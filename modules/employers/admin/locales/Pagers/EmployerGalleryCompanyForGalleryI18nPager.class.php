<?php


class EmployerGalleryCompanyForGalleryI18nPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerGalleryCompany","EmployerCompany"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerGalleryCompany();   
            $item->set('employer_id',$items->getEmployerCompany());      
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}
