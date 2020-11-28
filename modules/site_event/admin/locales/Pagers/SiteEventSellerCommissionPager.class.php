<?php


class SiteEventSellerCommissionPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('SiteEventSellerCommission'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getSiteEventSellerCommission();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
