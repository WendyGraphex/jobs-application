<?php


class CustomerAbuseTypePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'CustomerAbuseType',
           'CustomerAbuseTypeI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getCustomerAbuseType();   
           //   var_dump($item);
              $item->setI18n($items->hasCustomerAbuseTypeI18n()?$items->getCustomerAbuseTypeI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


