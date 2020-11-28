<?php


class employers_forgotPasswordSentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();
         $this->employer_user=$request->getRequestParameter('employer_user');         
    }
    
 
   
}


