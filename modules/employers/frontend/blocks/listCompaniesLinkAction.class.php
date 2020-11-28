<?php

 
class employers_listCompaniesLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
         $this->tpl=$this->getParameter('tpl','default');         
    } 
    
    
}
