<?php

require_once __DIR__."/../locales/Forms/EmployeeCompletionForm.class.php";


class employees_unlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();      
        $this->settings=new EmployeeSettings();     
    } 
    
    
}