<?php


class CustomerAcademyTeacherUserSessionPager extends Pager {
    
   function __construct() {        
        parent::__construct(array("CustomerAcademyTeacherUser","CustomerAcademyTeacherUserSession"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {    
          // echo "<pre>"; var_dump($items);echo "</pre>";
            $item=$items->getCustomerAcademyTeacherUserSession();    
            $item->set('user_id',$items->getCustomerAcademyTeacherUser());
            $this->items[]=$item;                         
       }         
    }
    
}