<?php


 require_once __DIR__."/../locales/Forms/EmployerSigninForm.class.php";
 
class employers_signinAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
       if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEmployerUser())                
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_account')));                          
        $messages = mfMessages::getInstance();  
        $this->form=new EmployerSigninForm();
    }
    
   
}


