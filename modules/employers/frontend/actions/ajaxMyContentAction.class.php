<?php

require_once __DIR__."/../locales/Forms/EmployerMyContentI18nMultipleForm.class.php";

class employers_ajaxMyContentAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action ();    
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action ();
        $messages = mfMessages::getInstance();           
        $this->form= new EmployerMyContentI18nMultipleForm($this->getUser()->getGuardUser(),$request->getPostParameter('MyContent'));                      
        if (!$request->isMethod('POST') || !$request->getPostParameter('MyContent'))
            return ;
        $this->form->bind($request->getPostParameter('MyContent'));
        if ($this->form->isValid())
        {                  
           $this->form->getUser()->save();
           $messages->addInfo(__('My page has been updated.')) ; 
           $this->forward($this->getModuleName(), 'ajaxDashboard');
        }   
        else
        {
           $messages->addError(__('Form has some errors.')) ;
           //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }  
    }
    
   
}



