<?php

 

class employees_recentsLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                      
         $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}



