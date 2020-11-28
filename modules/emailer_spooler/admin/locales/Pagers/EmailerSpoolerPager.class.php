<?php


class EmailerSpoolerPager extends Pager {
    
    
    function __construct()
    {             
       parent::__construct(array('EmailerSpooler'));        
    }        
            
   
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmailerSpooler();                                                                                    
              $this->items[$item->get('id')]=$item;                            
       }          
    }
   
    
    
   
              
}

