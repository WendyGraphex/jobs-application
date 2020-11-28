<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserCompletionForm.class.php";


class customers_academy_teacher_completionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();       
       $this->teacher_user=$this->getUser()->getGuardUser();
       $this->form=new CustomerAcademyTeacherUserCompletionForm($this->teacher_user);
       $this->is_block=true;
    } 
    
    
}