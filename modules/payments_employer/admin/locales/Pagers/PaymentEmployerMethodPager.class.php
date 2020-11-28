<?php


class PaymentEmployerMethodPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentEmployerMethod','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentEmployerMethod();  
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
