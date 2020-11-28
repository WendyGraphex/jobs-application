<?php


class employees_accountAction extends mfAction {
             
    
    function execute(mfWebRequest $request) {                                                    
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();    // $user->getGuardUser()            
    }
    
   
}


