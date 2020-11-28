<?php


class customers_academy_teacher_accountAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {               
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isTeacherUser())             
             $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_teacher_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
    }
    
   
}


