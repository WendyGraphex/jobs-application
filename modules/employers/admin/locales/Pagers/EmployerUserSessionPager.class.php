<?php


class EmployerUserSessionPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("EmployerUser","EmployerUserSession"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getEmployerUserSession();    
            $item->set('user_id',$items->getEmployerUser());
            $this->items[]=$item;                         
       }         
    }
    
}