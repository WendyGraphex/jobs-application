<?php

/*
 * www.project55.net/payments/check/success
 * 
 * 
 */

class payments_CancelAction extends mfAction {
    
    function execute(mfWebRequest $request)
    {       
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));
        $messages = mfMessages::getInstance(); 
          // var_dump($request->getRequestParameter('method'));
        // check if payment method exists
        
        $this->forward("payments_".$request->getRequestParameter('method'),"Cancel");  
           
    }
   
}

