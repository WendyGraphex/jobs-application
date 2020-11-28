<?php

class employers_contactLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
