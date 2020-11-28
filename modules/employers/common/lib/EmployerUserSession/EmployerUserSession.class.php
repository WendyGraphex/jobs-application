<?php

class EmployerUserSession extends UserGuardSessionBase  {
        
    const table="t_employer_user_session"; 
    protected static $foreignKeys=array('user_id'=>'EmployerUser');          
    
    function getUser()
    {
        return $this->_user_id=$this->_user_id===null?new EmployerUser($this->get('user_id')):$this->_user_id;
    }
}
