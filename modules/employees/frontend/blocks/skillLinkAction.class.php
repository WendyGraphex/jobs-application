<?php

 

class employees_skillLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                      
         $this->tpl=$this->getParameter('tpl','default');
         $this->skill=$this->getParameter('skill');         
    } 
    
    
}



