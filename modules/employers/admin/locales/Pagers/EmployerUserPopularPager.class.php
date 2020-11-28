<?php


class EmployerUserPopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("EmployerUserPopular","page"=>"EmployerUser","Employee","employer"=>"EmployerUser"));  
        $this->setAlias(array('employer'=>'employer','page'=>'page'));
    }
    
    protected function fetchObjects($db)
    {                    
       while ($items = $db->fetchObjects()) 
       {                                        
            $item=$items->getEmployerUserPopular();   
            $item->set('user_id',$items->getPage());          
            $item->set('employee_user_id',$items->hasEmployee()?$items->getEmployee():false);
            $item->set('employer_user_id',$items->hasEmployer()?$items->getEmployer():false);           
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}