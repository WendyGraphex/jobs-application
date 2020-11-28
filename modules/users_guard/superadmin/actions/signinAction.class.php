<?php


class users_guard_signinAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {       
        // If AJAX or File requested   
        if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }
        
        $messages = mfMessages::getInstance();
        $this->form = new UserGuardForm();
        $this->time_out = $this->getUser()->getSessionExpired() ? $this->getUser()->getOption('timeout') : false;
        try {
            
            if ($request->isMethod('post')) {
                $this->form->bind($request->getPostParameter('signin'));
                if ($this->form->isValid()) {
                    $values = $this->form->getValues();
                    $this->getUser()->signin($values['user'],(isset($values['remember'])?$values['remember']:false));
                    $this->userAuthentified(); // On fait le reste au shutdown
                    // Go to the page requested                      
                    $this->redirect($request->getReferer());
                } 
                else
                {
                    $messages->addErrors($this->form->getErrorSchema()->getGlobalErrors());  
                }
            }
            
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
    }
    
    protected function userAuthentified()
    {
        register_shutdown_function(array("users_guard_signinAction","shutdown"),$this->form->getValue('user'));
    }
    
    static function shutdown($user)
    {
      mfContext::getInstance()->getEventManager()->notify(new mfEvent($user, 'user.signin')); 
    }
}


