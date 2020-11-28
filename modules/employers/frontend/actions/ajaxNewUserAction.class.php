<?php

require_once __DIR__."/../locales/Forms/EmployerUserNewForm.class.php";

class employers_ajaxNewUserAction extends mfAction {
    
  
    function execute(mfWebRequest $request) {      
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
            $this->forwardTo401Action();            
        $messages = mfMessages::getInstance(); 
            // var_dump($request->getPostParameter('Employer'));
        $this->form= new EmployerUserNewForm($this->getUser()->getGuardUser(),$request->getPostParameter('EmployerUser'));             
        $this->item=new EmployerUser();
        $this->item->add($this->form->getDefaults());
            if (!$request->isMethod('POST') || !$request->getPostParameter('EmployerUser'))
            return ;
            $this->form->bind($request->getPostParameter('EmployerUser'),$request->getFiles('EmployerUser'));
            if ($this->form->isvalid())
            {
                $this->item->add($this->form->getValues());
                if ($this->item->isExist()) 
                            throw new mfException (__("User already exists."));                 
                $this->item->setAvatarFile($this->form->getAvatar()); 
                $this->item->setPassword();
                $this->item->save();
                
                $engine = new EmployerUserEmailEngine($this->item);
                $engine->sendUserCreation();
                
                $messages->addInfo(__('User has been created.'));             
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