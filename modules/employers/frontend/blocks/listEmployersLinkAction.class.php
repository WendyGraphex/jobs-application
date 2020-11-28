<?php

 
class employers_listEmployersLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {                         
         $this->tpl=$this->getParameter('tpl','default');         
    } 
    
    
}
