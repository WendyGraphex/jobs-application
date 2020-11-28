<?php


class tests_profileAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
       // echo __METHOD__;
         $messages = mfMessages::getInstance(); 
         $this->profiles=$this->getUser()->getStorage()->read('profiles');                           
    } 
}

