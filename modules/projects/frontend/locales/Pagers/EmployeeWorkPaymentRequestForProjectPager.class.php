<?php


class EmployeeWorkPaymentRequestForProjectPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('EmployeeWorkPaymentRequest'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getEmployeeWorkPaymentRequest();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
