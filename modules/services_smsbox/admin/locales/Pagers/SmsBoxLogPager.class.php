<?php


class SmsBoxLogPager extends Pager {
    
    
    function __construct()
    {             
        parent::__construct('SmsBoxLog');
    } 
    
//    protected function fetchObjects($db)
//    {              
//        
//        while ($items = $db->fetchObjects()) 
//        {                 
//            $item=$items->getCustomerMeetingImportFile();                                                                                                         
//            $this->items[$item->get('id')]=$item;                            
//        }         
//        
//        echo '<pre>'; var_dump($this->items); echo '</pre>';
//        die(__METHOD__);
//    }
    
   
              
}

