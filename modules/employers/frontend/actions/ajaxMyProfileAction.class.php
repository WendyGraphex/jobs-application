<?php

require_once __DIR__."/../locales/Forms/EmployerMyProfileForm.class.php";

class employers_ajaxMyProfileAction extends mfAction {
    
     
    
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_employer_redirect_signin')));
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->employer_user=$this->getUser()->getGuardUser();
        $this->form=new EmployerMyProfileForm($this->getUser()->getGuardUser(),$request->getPostParameter('MyProfile'));       
         if (!$request->isMethod('POST') || !$request->getPostParameter('MyProfile'))
                return ;
         $this->form->bind($request->getPostParameter('MyProfile'),$request->getFiles('MyProfile'));
            if ($this->form->isvalid())
            {
              //  var_dump($this->form->getValues());
                $this->employer_user->add($this->form->getValues());      
                $this->employer_user->setAvatarFile($this->form->getAvatar());                                
                $this->employer_user->save();       
                $this->employer_user->updateCategories($this->form->getCategories());          
                $this->employer_user->updateUserLanguages($this->form->getUserLanguages());              
                if ($this->employer_user->isProfileCompleted())
                    $messages->addInfo(__('Your profile has been updated and completed.'));         
                else
                    $messages->addInfo(__('Your profile has been updated.'));            
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->employer_user->add($this->form->getDefaults());              
            }
                       
    }
    
   
}


