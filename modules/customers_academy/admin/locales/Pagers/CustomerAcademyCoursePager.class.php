<?php


class CustomerAcademyCoursePager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyCourseI18n","CustomerAcademyTeacherUser"));  
        
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyCourseI18n();             
            $item->set('teacher_user_id',$items->hasCustomerAcademyTeacherUser()?$items->getCustomerAcademyTeacherUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}