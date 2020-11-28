<?php


class PaymentCheckPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentEmployerUser'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentEmployerUser();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
