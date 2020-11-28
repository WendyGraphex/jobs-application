<?php


class CustomerAdminMessagePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerMessage","User","EmployerUser","Employee"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerMessage();   
            $item->set('user_id',$items->hasUser()?$items->getUser():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);           
            $this->items[$item->get('id')]=$item;                         
       }    
       CustomerMessageFile::loadMessagesForPager($this);
    } 
}