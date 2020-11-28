<?php


class employees_comment_emailCommentnAction extends mfAction {
         
    function execute(mfWebRequest $request) {                 
           $this->employer_user=$this->getParameter('employer_user')->getFormatter()->toArrayForEmail();
           $this->comments_i18n=$this->getParameter('comments_i18n');
           $this->company=$this->getParameter('company')->toArray();                     
           $this->model_i18n= $this->getParameter('model_i18n');                
    }
        
}


