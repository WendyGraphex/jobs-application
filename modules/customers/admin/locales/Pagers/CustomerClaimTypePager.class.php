<?php


class CustomerClaimTypePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'CustomerClaimType',
           'CustomerClaimTypeI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getCustomerClaimType();   
           //   var_dump($item);
              $item->setI18n($items->hasCustomerClaimTypeI18n()?$items->getCustomerClaimTypeI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


