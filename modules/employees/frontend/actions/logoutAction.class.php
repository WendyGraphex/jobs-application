<?php


class employees_logoutAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {         
         $this->getUser()->logout();  
         $this->getUser()->getStorage()->removeAll();
         $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));     
    }
    
   
}


