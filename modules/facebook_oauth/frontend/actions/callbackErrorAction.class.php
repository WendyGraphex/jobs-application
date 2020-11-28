<?php


class facebook_oauth_callbackErrorAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();    
       // if (!$messages->hasMessages())
        //    $this->forwardTo401Action();           
    }
    
   
}
