<?php


class ProjectForEmployerPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("Project","EmployeeWork","SaleEmployeeQuotation"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getProject();         
            $item->set('work_id',$items->getEmployeeWork());
            $item->set('quotation_id',$items->getSaleEmployeeQuotation());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}