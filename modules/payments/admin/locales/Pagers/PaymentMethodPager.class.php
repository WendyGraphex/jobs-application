<?php


class PaymentMethodPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentMethod();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
