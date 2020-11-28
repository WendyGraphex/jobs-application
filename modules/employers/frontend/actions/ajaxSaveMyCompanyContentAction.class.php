<?php

require_once __DIR__."/../locales/Forms/SupplierMyCompanyContentForm.class.php";

class suppliers_ajaxSaveMyCompanyContentAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isSupplierUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_supplier_redirect_signin')));       
        if (!$this->getUser()->getGuardUser()->isAdmin())
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                 
        $this->form= new SupplierMyCompanyContentForm($this->getUser(),$request->getPostParameter('MyCompanyContent'));
        $this->form->bind($request->getPostParameter('MyCompanyContent'));
        if ($this->form->isValid())
        {            
           $this->form->getCompany()->updateContents($this->form->getContents());
           $messages->addInfo(__('Descriptions have been updated.')) ; 
        }   
        else
        {
           $messages->addError(__('Form has some errors.')) ;
         //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
   
}




