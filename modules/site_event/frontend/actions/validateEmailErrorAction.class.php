<?php


class site_event_validateEmailErrorAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();      
        $this->user=$this->getUser();
    }
    
   
}


