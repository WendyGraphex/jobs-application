<?php


class CustomerAcademyStudentUserSessionPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("CustomerAcademyStudentUser","CustomerAcademyStudentUserSession"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getCustomerAcademyStudentUserSession();    
            $item->set('user_id',$items->getCustomerAcademyStudentUser());
            $this->items[]=$item;                         
       }         
    }
    
}