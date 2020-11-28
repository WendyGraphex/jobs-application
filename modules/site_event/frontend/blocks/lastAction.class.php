<?php

class site_event_lastActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request)
    { 
        $this->tpl=$this->getParameter('tpl','default.tpl');
        $this->last_events=SiteEventUtils::getLast();
    } 
    
    
}