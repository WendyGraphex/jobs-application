<?php

require_once __DIR__."/../locales/Forms/EmployerPostAJobForm.class.php";
 
class employers_postAJobActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                                
        $this->user=$this->getUser();
        $this->from_callback=$this->getUser()->getStorage()->read('post_a_job_employer_user_callback',false);        
         if (!$this->from_callback)
             return ; 
        $this->employer_user=$this->getUser()->getStorage()->read('post_a_job_employer_user');           
        $this->form=new EmployerPostAJobForm($this->employer_user);   
        $this->getUser()->getStorage()->remove('post_a_job_employer_user_callback');
    } 
    
    
}
