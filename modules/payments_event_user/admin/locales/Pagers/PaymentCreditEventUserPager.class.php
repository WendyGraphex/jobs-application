<?php


class PaymentCreditEventUserPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('PaymentCreditEventUser','SiteEventOrder','SiteEventUser','PaymentMethod'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getPaymentCreditEventUser();   
              $item->set('order_id',$items->getSiteEventOrder());
              $item->set('event_user_id',$items->getSiteEventUser());
              $item->set('method_id',$items->getPaymentMethod());
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
