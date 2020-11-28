<?php

 
class site_event_bookEventActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {              
        $this->tpl=$this->getParameter('tpl','default');
    } 
    
    
}