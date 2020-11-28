<?php


class customers_academy_student_forgotPasswordSentAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
         $messages = mfMessages::getInstance();
         $this->user=$request->getRequestParameter('user');         
    }
    
 
   
}


