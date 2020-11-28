<?php


class employees_forgotPasswordSentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();
         $this->employee=$request->getRequestParameter('employee');         
    }
    
 
   
}


