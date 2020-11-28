<?php


class EmailerSpoolerSchedulerPager extends Pager {
    
    
    function __construct()
    {             
       parent::__construct(array('EmailerSpoolerScheduler'));        
    }        
            
   
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmailerSpoolerScheduler();                                                                                                 
              $this->items[$item->get('id')]=$item;                            
       }          
    }
   
    
    
   
              
}

