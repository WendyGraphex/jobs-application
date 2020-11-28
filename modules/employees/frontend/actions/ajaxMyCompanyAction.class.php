<?php

require_once __DIR__."/../locales/Forms/EmployeeMyCompanyForm.class.php";

class employees_ajaxMyCompanyAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employee_redirect_signin')));
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        $this->item=$this->getUser()->getGuardUser()->getCompany();             
        $this->form= new EmployeeMyCompanyForm();   
    }
   
}


