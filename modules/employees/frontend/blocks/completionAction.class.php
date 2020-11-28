<?php

require_once __DIR__."/../locales/Forms/EmployeeCompletionForm.class.php";


class employees_completionActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();       
       $this->employee=$this->getUser()->getGuardUser();
       $this->form=new EmployeeCompletionForm($this->employee);
       $this->is_block=true;
    } 
    
    
}