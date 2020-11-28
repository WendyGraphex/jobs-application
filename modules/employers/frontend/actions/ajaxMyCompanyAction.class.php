<?php

require_once __DIR__."/../locales/Forms/EmployerMyCompanyForm.class.php";

class employers_ajaxMyCompanyAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->item=$this->getUser()->getGuardUser()->getCompany();             
        $this->form= new EmployerMyCompanyForm($this->getUser()->getGuardUser());   
    }
   
}


