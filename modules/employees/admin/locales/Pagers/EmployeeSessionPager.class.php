<?php


class EmployeeSessionPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("Employee","EmployeeSession"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getEmployeeSession();    
            $item->set('user_id',$items->getEmployee());
            $this->items[]=$item;                         
       }         
    }
    
}