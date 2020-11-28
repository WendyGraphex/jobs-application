<?php

 
class site_event_ajaxBookEventDialogAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forward('site_event','ajaxLoginDialog');        
        $messages= mfMessages::getInstance();     
        $this->event= new SiteEvent(new mfString($request->getPostParameter('SiteEventDialog')));      
        $this->max_characters=500;
    }
    
   
}



