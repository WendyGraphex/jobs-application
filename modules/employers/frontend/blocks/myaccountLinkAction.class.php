<?php

class employers_myaccountLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->user=$this->getUser();
        $this->tpl=$this->getParameter('tpl','default');
    }         
}

