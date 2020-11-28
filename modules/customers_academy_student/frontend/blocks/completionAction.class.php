<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserCompletionForm.class.php";


class customers_academy_student_completionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();       
       $this->student_user=$this->getUser()->getGuardUser();
       $this->form=new CustomerAcademyStudentUserCompletionForm($this->student_user);
       $this->is_block=true;
    } 
    
    
}