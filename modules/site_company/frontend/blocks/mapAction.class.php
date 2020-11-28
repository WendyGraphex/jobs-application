<?php

class site_company_mapActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
   
}

