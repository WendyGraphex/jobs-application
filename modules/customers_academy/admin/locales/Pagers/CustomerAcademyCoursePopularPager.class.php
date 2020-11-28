<?php


class CustomerAcademyCoursePopularPager extends Pager {
    
    function __construct() {        
        parent::__construct(array("CustomerAcademyCoursePopular",
                                  "CustomerAcademyCourse",
                                  "CustomerAcademyStudentUser","CustomerAcademyTeacherUser"));  
        
    }
    
    protected function fetchObjects($db)
    {              
       while ($items = $db->fetchObjects()) 
       {                             
            $item=$items->getCustomerAcademyCoursePopular();   
            $item->set('course_id',$items->getCustomerAcademyCourse());          
            $item->set('student_user_id',$items->hasCustomerAcademyStudentUser()?$items->getCustomerAcademyStudentUser():false);
            $item->set('teacher_user_id',$items->hasCustomerAcademyTeacherUser()?$items->getCustomerAcademyTeacherUser():false);
            $this->items[$item->get('id')]=$item;                         
       }         
    } 
}