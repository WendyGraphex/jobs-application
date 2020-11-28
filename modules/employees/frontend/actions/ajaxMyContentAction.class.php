<?php

require_once __DIR__."/../locales/Forms/EmployeeMyContentI18nMultipleForm.class.php";

class employees_ajaxMyContentAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action ();          
      //  echo $this->getUser()->getGuardUser()->get('id');
        $messages = mfMessages::getInstance();           
        $this->form= new EmployeeMyContentI18nMultipleForm($this->getUser()->getGuardUser(),$request->getPostParameter('MyContent'));                      
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



