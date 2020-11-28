<?php

class EmployeeSession extends UserGuardSessionBase  {
       
    const table="t_employee_session";    
    protected static $foreignKeys=array('user_id'=>'Employee'); 
   
    function getUser()
    {
        if (!$this->_employee_id)
        {
            $this->_employee_id=new Employee($this->get('user_id'));            
        }    
        return $this->_employee_id;
    }
}