<?php


class customers_academy_student_validateEmailErrorAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {               
        $messages = mfMessages::getInstance();      
        $this->user=$this->getUser();
    }
    
   
}


