<?php


class site_event_accountAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_user_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
    }
    
   
}


