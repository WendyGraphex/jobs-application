<?php


class EmailerSpoolerPager extends Pager {
    
    
    function __construct()
    {             
       parent::__construct(array('EmailerSpooler','Site','EmailerSpoolerSchedulerEmailSent'));        
    }        
            
   
    protected function fetchObjects($db)
    {               
       while ($items = $db->fetchObjects()) 
       {                                  
              $item=$items->getEmailerSpoolerSchedulerEmailSent();   
              $item->set('email_id',$items->getEmailerSpooler());
              $item->getEmail()->set('site_id',$items->getSite());   
              $this->items[$item->get('id')]=$item;                            
       }          
    }
   
    
    
   
              
}

