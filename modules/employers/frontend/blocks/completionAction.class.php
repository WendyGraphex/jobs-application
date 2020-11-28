<?php

require_once __DIR__."/../locales/Forms/EmployerCompletionForm.class.php";


class employers_completionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();       
       $this->form=new EmployerCompletionForm($this->user->getGuardUser());
       $this->employer_user=$this->getUser()->getGuardUser();      
       $this->is_block=true;
    } 
    
    
}