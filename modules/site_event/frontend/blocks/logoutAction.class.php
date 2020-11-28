<?php

class site_event_logoutActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
        if (!$this->getUser()->isAuthenticated())
            return mfView::NONE;  
        if (!$this->getUser()->isEventUser())
            return ;
    } 
    
    
}
