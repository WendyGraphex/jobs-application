<?php


class PaymentEmployerUserPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentEmployerUser','SaleOrder','EmployerUser','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentEmployerUser();   
              $item->set('order_id',$items->getSaleOrder());
              $item->set('employer_user_id',$items->getEmployerUser());
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
