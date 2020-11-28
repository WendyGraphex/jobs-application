<?php


class payments_ReturnAction extends mfAction {
    
    function execute(mfWebRequest $request) {       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));
        $messages = mfMessages::getInstance();           
        if (!$request->getRequestParameter('payment_employer_user',false))
            $this->forward404();      
        $this->payment_employer_user=$request->getRequestParameter('payment_employer_user');
        $this->user=$this->getUser();
        
        
    }
}


