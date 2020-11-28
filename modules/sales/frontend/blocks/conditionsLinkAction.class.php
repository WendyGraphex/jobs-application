<?php

class sales_conditionsLinkActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
       $this->tpl=$this->getParameter('tpl','default');
    } 
    
   
}

