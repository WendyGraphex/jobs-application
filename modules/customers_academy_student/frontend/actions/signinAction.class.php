<?php


 require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserSigninForm.class.php";
 
class customers_academy_student_signinAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {
       if ($request->isXmlHttpRequest()||$request->getURIExtension()) {
            $this->getResponse()->setStatusCode(403);
            return mfView::HEADER_ONLY;
        }  
        if ($this->getUser()->isAuthenticated() && $this->getUser()->isEventUser())                
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_account')));                          
        $messages = mfMessages::getInstance();  
        $this->form=new CustomerAcademyStudentUserSigninForm();
    }
    
   
}


