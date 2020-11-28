<?php

class site_event_order_conditionsLinkActionComponent extends mfActionComponent {
    
    
    function execute(mfWebRequest $request)
    {       
       $this->tpl=$this->getParameter('tpl','default');
    } 
    
   
}

