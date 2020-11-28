<?php

class cart_cartLinkActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {               
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}
