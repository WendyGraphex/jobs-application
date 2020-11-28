<?php


class PaymentCreditEventUserMethodPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentCreditEventUserMethod','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentCreditEventUserMethod();  
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
