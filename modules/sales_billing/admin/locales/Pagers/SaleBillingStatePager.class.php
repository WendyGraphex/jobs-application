<?php


class SaleBillingStatePager extends Pager {

 
    
    function __construct()
    {             
       parent::__construct(array(
           'SaleBillingState',
           'SaleBillingStateI18n',
       ));      
      
    }        
            
    protected function fetchObjects($db)
    {               
       // echo "<pre>";
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getSaleBillingState();   
           //   var_dump($item);
              $item->setI18n($items->hasSaleBillingStateI18n()?$items->getSaleBillingStateI18n():false);              
              $this->items[$item->get('id')]=$item;                            
       }                 
    }
   
    
}


