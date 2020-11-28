<?php

 

class employees_skillsAdvertsLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                      
         $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}



