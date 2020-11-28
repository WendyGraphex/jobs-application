<?php

class CustomerAcademyTeacherUserSession extends UserGuardSessionBase  {
        
    const table="t_customer_academy_teacher_user_session"; 
    protected static $foreignKeys=array('user_id'=>'CustomerAcademyTeacherUser');          
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new CustomerAcademyTeacherUser($this->get('user_id')):$this->_user_id;
    }
}
