<?php

 

class employees_skillEmployeesLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                      
         $this->tpl=$this->getParameter('tpl','default');
         $this->skill=$this->getParameter('skill');         
    } 
    
    
}



