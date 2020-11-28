<?php


class CustomerEmployeeMessagePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerEmployeeMessage","EmployerUser","User"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerEmployeeMessage();      
            $item->set('user_id',$items->hasUser()?$items->getUser():false);      
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);      
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}