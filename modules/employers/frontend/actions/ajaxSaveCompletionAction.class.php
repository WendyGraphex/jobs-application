<?php

require_once __DIR__."/../locales/Forms/EmployerCompletionForm.class.php";

class employers_ajaxSaveCompletionAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser() || !$this->getUser()->getGuardUser()->isAdmin())             
            $this->forwardTo401Action();             
        $messages = mfMessages::getInstance(); 
        $this->user=$this->getUser();
        $this->employer_user=$this->getUser()->getGuardUser();
        $this->form=new EmployerCompletionForm($this->employer_user,$request->getPostParameter('MyProfile'));
         if (!$request->isMethod('POST') || !$request->getPostParameter('MyProfile'))
                return ;
        try
        {                     
            $this->form->bind($request->getPostParameter('MyProfile'),$request->getFiles('MyProfile'));
            if ($this->form->isvalid())
            {
                $this->employer_user->add($this->form->getValues());       
                if ($this->form->hasCompany())
                {                                         
                    $this->employer_user->getCompany()->add($this->form->getValuesForCompany());
                    $this->employer_user->getCompany()->setLogoFile($this->form->getLogo());
                    $this->employer_user->getCompany()->setPictureFile($this->form->getPicture());
                    $this->employer_user->getCompany()->save();               
                    $this->employer_user->set('company_id',$this->employer_user->getCompany());                        
                }    
                $this->employer_user->setAvatarFile($this->form->getAvatar());
                $this->employer_user->process();
                $this->employer_user->save();       
                $this->employer_user->updateCategories($this->form->getCategories());                     
                $this->employer_user->updateUserLanguages($this->form->getUserLanguages());   
                if ($this->form->isCompleted())
                    $messages->addInfo(__('Your account has been updated and completed.'));         
                else
                    $messages->addInfo(__('Your account has been updated.'));         
                
                if ($this->form->isCompleted())
                {
                     $engine_email=new EmployerUserEmailEngine($this->employer_user);
                    $engine_email->sendCongratulations();    
                }    
                $this->forward($this->getModuleName(), 'ajaxHome');
            }   
            else
            {
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->employer_user->add($this->form->getDefaults());
                $this->employer_user->getCompany()->add($this->form->getDefault('company'));
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}


