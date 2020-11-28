<?php


class EmployeeAdvertCommentPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployeeAdvertComment","EmployeeAdvertCommentI18n","Employee","EmployerUser","EmployeeAdvertI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployeeAdvertCommentI18n();                        
            $item->set('comment_id',$items->getEmployeeAdvertComment());       
            $item->getComment()->set('employee_user_id',$items->getEmployee()) ;
            $item->getComment()->set('employer_user_id',$items->getEmployerUser());
            $item->getComment()->set('advert_i18n',$items->getEmployeeAdvertI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}