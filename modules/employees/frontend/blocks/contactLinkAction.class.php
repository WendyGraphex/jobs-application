<?php

class employees_contactLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
