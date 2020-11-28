<?php

class site_ajaxEmailerAction extends mfAction {
    
   
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        
        $this->transport=$this->getMailer()->getTransport();
        
    }
}

