<?php

/*
 * www.project55.net/payments/check/success
 * 
 * 
 */

class payments_EventSuccessAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_account')));
        $messages = mfMessages::getInstance(); 
          // var_dump($request->getRequestParameter('method'));
        // check if payment method exists
      
        $this->forward("payments_".$request->getRequestParameter('method'),"EventSuccess");  
           
    }
   
}

