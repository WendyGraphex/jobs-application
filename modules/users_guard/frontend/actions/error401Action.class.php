<?php


class users_guard_error401Action extends mfAction {
    
     
    function execute(mfWebRequest $request) {
            $this->getResponse()->setHttpHeader('HTTP/1.1 401 Not authorized');
            $this->getResponse()->setHttpHeader('Status','401');
            $this->getResponse()->sendHttpHeaders();
    }
    
   
}


