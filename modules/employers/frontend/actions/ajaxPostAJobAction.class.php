<?php

require_once __DIR__."/../locales/Forms/EmployerPostAJobForm.class.php";
 

class employers_ajaxPostAJobAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEmployerUser()) 
            $this->forward($this->getModuleName(),'ajaxPostAJobAdvert');    
        $this->employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user',new EmployerUser());       
        $this->form=new EmployerPostAJobForm($this->employer_user);        
    } 
   
}


