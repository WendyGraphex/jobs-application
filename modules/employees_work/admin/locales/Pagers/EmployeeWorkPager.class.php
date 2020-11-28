<?php


class EmployeeWorkPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('EmployeeWork','Employee','EmployerUser','SaleOrder'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getEmployeeWork();   
              $item->set('employer_user_id',$items->getEmployerUser());
              $item->set('employee_user_id',$items->getEmployee());              
              $item->set('order_id',$items->getSaleOrder());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
