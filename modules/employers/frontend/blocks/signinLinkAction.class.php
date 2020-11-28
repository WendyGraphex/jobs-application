<?php

class employers_signinLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $this->tpl=$this->getParameter('tpl','default');
     
    } 
    
    
}
