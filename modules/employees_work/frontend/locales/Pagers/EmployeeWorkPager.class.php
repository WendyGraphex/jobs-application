<?php


class EmployeeWorkPager extends Pager{
    
        
    function __construct()
    {             
       parent::__construct(array('EmployeeWork'));            
    }        
            
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                       
              $item=$items->getEmployeeWork();                            
              $this->items[$item->get('id')]=$item;                            
       }         
    }
   
}
