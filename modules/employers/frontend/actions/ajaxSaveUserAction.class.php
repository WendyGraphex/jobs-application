<?php

require_once __DIR__."/../locales/Forms/EmployerUserViewForm.class.php";

class employers_ajaxSaveUserAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action();            
        $messages = mfMessages::getInstance(); 
            // var_dump($request->getPostParameter('Employer'));
        $this->form= new EmployerUserViewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerUser'));             
        $this->item=new EmployerUser($request->getPostParameter('EmployerUser'),$this->getUser()->getGuardUser());             
        if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerUser') || $this->item->isNotLoaded())
            return ;
        $this->form->bind($request->getPostParameter('EmployerUser'),$request->getFiles('EmployerUser'));
        if ($this->form->isValid())
        {
            $this->item->add($this->form->getValues());
            if ($this->item->isExist()) 
                        throw new mfException (__("User already exists."));                 
            $this->item->setAvatarFile($this->form->getAvatar());             
            $this->item->save();

            $messages->addInfo(__('User has been updated.'));             
            $this->forward('employers','ajaxListPartialUser');
        }   
        else
        {
          //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
            $messages->addError(__('Form has some errors.'));             
            $this->item->add($this->form->getDefaults());
        }    


    }
}