<?php

require_once __DIR__."/../locales/Forms/SiteEventUserMyProfileForm.class.php";

class site_event_ajaxMyProfileAction extends mfAction {
  
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_site_event_redirect_signin')));
        $messages = mfMessages::getInstance();    
        $this->user=$this->getUser();
        $this->event_user=$this->getUser()->getGuardUser();             
        $this->form=new SiteEventUserMyProfileForm($this->event_user,$request->getPostParameter('MyProfile'));            
        if (!$request->isMethod('POST') || !$request->getPostParameter('MyProfile'))
               return ;
         $this->form->bind($request->getPostParameter('MyProfile'),$request->getFiles('MyProfile'));
            if ($this->form->isvalid())
            {
               // var_dump($this->form->getValues());
                $this->event_user->add($this->form->getValues());     
                $this->event_user->setAvatarFile($this->form->getAvatar());        
                $this->event_user->save();                
                $messages->addInfo(__('Your profile has been updated.'));     
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
               //  var_dump($this->form->getDefaults());
              //   echo "<pre>";  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->event_user->add($this->form->getDefaults());              
            }  
    }
    
   
}


