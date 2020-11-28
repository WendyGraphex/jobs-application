<?php


class SaleEmployeeCommissionPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('SaleEmployeeCommission'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getSaleEmployeeCommission();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
