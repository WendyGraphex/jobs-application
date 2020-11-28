<?php


class employers_validateEmailErrorAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();      
        $this->user=$this->getUser();
    }
    
   
}


