<?php

require_once __DIR__."/../locales/Forms/EmployerCompletionForm.class.php";


class employers_unlockActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();        
       $this->settings=new EmployerSettings();      
    } 
    
    
}