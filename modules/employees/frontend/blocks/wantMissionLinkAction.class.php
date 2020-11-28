<?php

class employees_wantMissionLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {                    
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
