<?php

class employees_shareLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
       $this->user=$this->getUser();
       $this->max_characters=500;
       $this->employee_user=$this->getParameter('employee_user');
       $this->text=new mfString(__("Spread the word about this employee on Graphex"));
    } 
    
    
}