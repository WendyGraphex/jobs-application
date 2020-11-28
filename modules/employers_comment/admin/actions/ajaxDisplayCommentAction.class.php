<?php

 
class employers_comment_ajaxDisplayCommentAction extends mfAction {
    
      
    function execute(mfWebRequest $request) {

        $messages = mfMessages::getInstance();       
        $this->comment = new EmployerAdvertComment($request->getPostParameter('EmployerComment'));
    }
    
}
