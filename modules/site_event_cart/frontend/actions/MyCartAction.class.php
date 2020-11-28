<?php

 
class site_event_cart_MyCartAction extends mfAction {
 

       function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();       
        if (!$this->getUser()->isEventUser())   
        {            
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_signin')));
        }
        $this->forward('site_event', 'account');        
    }
}
