<?php

require_once __DIR__."/../locales/Forms/EmployerMyCompanyContentI18nMultipleForm.class.php";

class employers_ajaxMyCompanyContentAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();    
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();           
        $this->form= new EmployerMyCompanyContentI18nMultipleForm($this->getUser()->getGuardUser(),$request->getPostParameter('MyCompanyContent'));            
        if (!$request->isMethod('POST') || !$request->getPostParameter('MyCompanyContent'))
            return ;
        $this->form->bind($request->getPostParameter('MyCompanyContent'));
        if ($this->form->isValid())
        {                  
           $this->form->getCompany()->save();
           $messages->addInfo(__('Company page have been updated.')) ; 
        }   
        else
        {
           $messages->addError(__('Form has some errors.')) ;
          //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }  
    }
    
   
}



