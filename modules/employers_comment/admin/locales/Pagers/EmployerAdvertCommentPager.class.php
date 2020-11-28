<?php


class EmployerAdvertCommentPager extends mfPager2 {
    
    function __construct() {        
        parent::__construct(array("EmployerAdvertComment","EmployerAdvertCommentI18n","Employee","EmployerUser","EmployerAdvertI18n"));                
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getEmployerAdvertCommentI18n();                        
            $item->set('comment_id',$items->getEmployerAdvertComment());       
            $item->getComment()->set('employee_user_id',$items->getEmployee()) ;
            $item->getComment()->set('employer_user_id',$items->getEmployerUser());
            $item->getComment()->set('advert_i18n',$items->getEmployerAdvertI18n());
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}