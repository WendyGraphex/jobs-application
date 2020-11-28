<?php

class site_event_listLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
        $this->tpl=$this->getParameter('tpl','default');
     
    } 
    
    
}
