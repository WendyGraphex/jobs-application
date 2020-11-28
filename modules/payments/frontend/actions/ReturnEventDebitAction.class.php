<?php


class payments_ReturnEventDebitAction extends mfAction {
    
    function execute(mfWebRequest $request) {       
        if (!$this->getUser()->isEventUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_account')));
        $messages = mfMessages::getInstance();           
        if (!$request->getRequestParameter('payment_event_user',false))
            $this->forward404();      
        $this->payment_event_user=$request->getRequestParameter('payment_event_user');
        $this->user=$this->getUser();
        
        
    }
}


