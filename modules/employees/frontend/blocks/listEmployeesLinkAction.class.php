<?php

 
class employees_listEmployeesLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
         $this->tpl=$this->getParameter('tpl','default');         
    } 
    
    
}
