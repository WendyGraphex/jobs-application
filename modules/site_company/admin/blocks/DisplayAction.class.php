<?php

class site_company_DisplayActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {             
        $this->company=SiteCompany::getSiteCompany();    
        $this->field=$this->getParameter('field');
        $this->tpl=$this->getParameter('tpl','default.tpl');
    } 
    
   
}

