<?php


class EmployeeUserPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployeeUserPopular","page"=>"Employee","employee"=>"Employee","EmployerUser"));  
        $this->setAlias(array('employee'=>'employee','page'=>'page'));
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeUserPopular();   
            $item->set('user_id',$items->getPage());          
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployerUser()?$items->getEmployerUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}