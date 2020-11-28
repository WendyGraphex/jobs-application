<?php


class PaymentDebitEventUserMethodPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentDebitEventUserMethod','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentDebitEventUserMethod();  
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
