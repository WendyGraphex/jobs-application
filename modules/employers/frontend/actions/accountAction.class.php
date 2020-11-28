<?php


class employers_accountAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
    }
    
   
}


