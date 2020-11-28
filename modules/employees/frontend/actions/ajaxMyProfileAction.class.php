<?php

require_once __DIR__."/../locales/Forms/EmployeeMyProfileForm.class.php";

class employees_ajaxMyProfileAction extends mfAction {
    
     
   //http://www.project55.net/module/employee/admin/MyProfile 
    
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();    
        $this->user=$this->getUser();
        $this->employee=$this->getUser()->getGuardUser();        
      //  include_once __DIR__."/../data/post.php";
       // echo "<pre>"; var_dump($this->employee->getUserSkills()->toForm()->toArray());
        $this->form=new EmployeeMyProfileForm($this->employee,$request->getPostParameter('MyProfile'));            
        if (!$request->isMethod('POST') || !$request->getPostParameter('MyProfile'))
               return ;
         $this->form->bind($request->getPostParameter('MyProfile',$post),$request->getFiles('MyProfile'));
            if ($this->form->isvalid())
            {
               // var_dump($this->form->getValues());
                $this->employee->add($this->form->getValues());     
                $this->employee->setAvatarFile($this->form->getAvatar());        
                $this->employee->save();  
                $this->employee->updateCategories($this->form->getCategories());
                $this->employee->updateUserLanguages($this->form->getUserLanguages());
                $this->employee->updateUserSkills($this->form->getUserSkills());
                $this->employee->updateUserDiplomas($this->form->getUserDiplomas());                
                if ($this->employee->isProfileCompleted())
                    $messages->addInfo(__('Your profile has been updated and completed.'));         
                else
                    $messages->addInfo(__('Your profile has been updated.'));     
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
              //  echo "<pre>";  var_dump($this->form->getDefault('diplomas')); 
                var_dump($this->form->getErrorSchema()->getErrorsMessage());echo "</pre>";
                $messages->addError(__('Form has some errors.'));             
                $this->employee->add($this->form->getDefaults());              
            }  
   
    }
    
   
}


