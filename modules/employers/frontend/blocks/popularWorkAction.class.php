<?php

class employers_popularWorkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                           
        $this->tpl=$this->getParameter('tpl','default');
        $this->categories = EmployerWorkCategory::getCategoriesByNumberOfRequests($this->getUser()->getLanguage());       
    } 
    
    
}