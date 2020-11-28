<?php


class PaymentEmployeeUserCheckPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentEmployee'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentEmployee();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
