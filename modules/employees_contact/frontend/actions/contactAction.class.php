<?php


class employees_contact_contactAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->max_characters=500;
    }
    
   
}

