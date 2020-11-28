<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserMyProfileForm.class.php";

class customers_academy_teacher_ajaxMyProfileAction extends mfAction {
  
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isTeacherUser())             
            $this->redirect(to_link_i18n(mfConfig::get('mf_customers_academy_teacher_redirect_signin')));
        $messages = mfMessages::getInstance();    
        $this->user=$this->getUser();
        $this->teacher_user=$this->getUser()->getGuardUser();             
        $this->form=new CustomerAcademyTeacherUserMyProfileForm($this->teacher_user,$request->getPostParameter('MyProfile'));            
        if (!$request->isMethod('POST') || !$request->getPostParameter('MyProfile'))
               return ;
         $this->form->bind($request->getPostParameter('MyProfile'),$request->getFiles('MyProfile'));
            if ($this->form->isvalid())
            {
               // var_dump($this->form->getValues());
                $this->teacher_user->add($this->form->getValues());     
                $this->teacher_user->setAvatarFile($this->form->getAvatar());        
                $this->teacher_user->save();                
                $messages->addInfo(__('Your profile has been updated.'));     
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
               //  var_dump($this->form->getDefaults());
              //   echo "<pre>";  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->teacher_user->add($this->form->getDefaults());              
            }  
    }
    
   
}


