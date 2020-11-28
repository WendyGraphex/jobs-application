<?php


class site_event_forgotPasswordSentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();
         $this->user=$request->getRequestParameter('user');         
    }
    
 
   
}


