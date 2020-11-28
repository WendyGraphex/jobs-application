<?php


class customers_academy_teacher_ajaxDashboardAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if ( !$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                     
    }
    
   
}


