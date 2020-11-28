<?php

require_once __DIR__."/../locales/Forms/EmployeeWantAJobForm.class.php"; 

class employees_wantAJobActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
        //$messages = mfMessages::getInstance();         
        $this->user=$this->getUser();        
        $this->from_callback=$this->getUser()->getStorage()->read('want_a_job_employee_user_callback',false);        
        if (!$this->from_callback)
             return ;  
        $this->employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user');        
        $this->form=new EmployeeWantAJobForm($this->employee_user); 
        $this->getUser()->getStorage()->remove('want_a_job_employee_user_callback');
    } 
    
    
}
