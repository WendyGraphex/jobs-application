<?php


class users_guard_signinAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
        if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }
        $messages = mfMessages::getInstance();
        $this->form = new UserGuardForm($request->getPostParameter('Signin'));
        $this->time_out = $this->getUser()->getSessionExpired() ? $this->getUser()->getOption('timeout') : false;
        try {
            
            if (!$request->isMethod('POST') || !$request->getPostParameter('Signin')) 
                return ;
            $this->form->bind($request->getPostParameter('Signin'));
            if ($this->form->isValid()) {
                $values = $this->form->getValues();                   
                $this->getUser()->signin($values['user'],(isset($values['remember'])?$values['remember']:false));
                // Go to the page requested          
                $this->redirect($request->getReferer());
            }       
            else
            {
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            }    
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
    }
    
   
}


