<?php


class CustomerEmployerMessagePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerEmployerMessage","Employee","User"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerEmployerMessage();      
            $item->set('user_id',$items->hasUser()?$items->getUser():false);      
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);      
          //  $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);     
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}