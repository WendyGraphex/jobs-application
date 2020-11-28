<?php

class CustomerAcademyStudentUserSession extends UserGuardSessionBase  {
        
    const table="t_customer_academy_student_user_session"; 
    protected static $foreignKeys=array('user_id'=>'CustomerAcademyStudentUser');          
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new CustomerAcademyStudentUser($this->get('user_id')):$this->_user_id;
    }
}
