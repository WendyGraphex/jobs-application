<?php


 require_once __DIR__."/../locales/Forms/EmployeeSigninForm.class.php";
 
class employees_signinAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
       if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEmployee())                
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_account')));                          
        $messages = mfMessages::getInstance();  
        $this->form=new EmployeeSigninForm();
    }
}


