<?php

class site_event_eventDisplayActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    {        
      
       $this->tpl=$this->getParameter('tpl','default');
       
    } 
    
    
}