<?php

class site_event_signinLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $this->tpl=$this->getParameter('tpl','default');
     
    } 
    
    
}
