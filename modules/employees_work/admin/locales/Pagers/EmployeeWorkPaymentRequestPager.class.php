<?php


class EmployeeWorkPaymentRequestPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('EmployeeWorkPaymentRequest','EmployeeWork','Employee','EmployerUser','SaleOrder','Project'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getEmployeeWorkPaymentRequest();    
              $item->set('employer_user_id',$items->getEmployerUser());
              $item->set('employee_user_id',$items->getEmployee());
              $item->set('work_id',$items->getEmployeeWork());
              $item->set('project_id',$items->getProject());
              $item->getWork()->set('order_id',$items->getSaleOrder());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
