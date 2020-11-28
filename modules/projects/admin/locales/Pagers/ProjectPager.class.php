<?php


class ProjectPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('Project','EmployeeWork','SaleOrder','SaleEmployeeQuotation'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getProject();                            
              $item->set('work_id',$items->getEmployeeWork());       
              $item->set('order_id',$items->getSaleOrder());     
              $item->set('quotation_id',$items->getSaleEmployeeQuotation());     
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
