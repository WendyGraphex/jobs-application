<?php


class SaleEmployerCommissionPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('SaleEmployerCommission'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getSaleEmployerCommission();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
