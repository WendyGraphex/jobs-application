<?php

class customers_academy_teacher_logoutActionComponent extends mfActionComponent {

    
    function execute(mfWebRequest $request) {    
                
        if (!$this->getUser()->isAuthenticated())
            return mfView::NONE;  
        if (!$this->getUser()->isTeacherUser())
            return ;
    } 
    
    
}
