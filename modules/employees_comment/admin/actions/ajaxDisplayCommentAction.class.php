<?php

 
class employees_comment_ajaxDisplayCommentAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->comment = new EmployeeAdvertComment($request->getPostParameter('EmployeeComment'));
    }
    
}
