<?php


class customers_academy_student_logoutAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {         
         $this->getUser()->logout();  
         $this->getUser()->getStorage()->removeAll();
         $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_student_redirect_signin')));     
    }
    
   
}


