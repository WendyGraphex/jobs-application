<?php

require_once __DIR__."/../locales/Forms/EmployeeWantAJobForm.class.php"; 

class employees_ajaxWantAJobAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEmployee()) 
            $this->forward($this->getModuleName(),'ajaxWantAJobAdvert');    
        $this->employee_user=$this->getUser()->getStorage()->read('want_a_job_employee_user',new Employee());        
        $this->form=new EmployeeWantAJobForm($this->employee_user); 
    }
    
   
}


