<?php


class PaymentEmployeeMethodPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentEmployeeMethod','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentEmployeeMethod();  
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
