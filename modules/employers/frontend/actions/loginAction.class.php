<?php




class employers_loginAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEmployerUser())
        {           
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));            
        }       
        $messages = mfMessages::getInstance();
        $this->form = new EmployerUserGuardForm($request->getPostParameter('Login'));
     //   $this->time_out = $this->getUser()->getSessionExpired() ? $this->getUser()->getOption('timeout') : false;
        try 
        {
            
            if ($request->isMethod('POST') && $request->getPostParameter('Login')) 
            {
                $this->form->bind($request->getPostParameter('Login'));
                if ($this->form->isValid()) {
                    $values = $this->form->getValues();
                    $this->getUser()->signin($values['user'],$request->getIP(),$this->form->getRemember());
                    // Go to the page requested         
                    $this->getEventDispather()->notify(new mfEvent($values['user'], 'employer.connected')); 
                    $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));    
                } 
                else 
                { 
                    //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                    $this->getEventDispather()->notify(new mfEvent($this, 'employer.failed.login', array_merge($request->getPostParameter('Login'),array('ip'=>$request->getIp()))));
                }    
            }
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
    }
    
   
}


