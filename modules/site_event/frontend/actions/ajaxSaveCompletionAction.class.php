<?php

require_once __DIR__."/../locales/Forms/SiteEventUserCompletionForm.class.php";

class site_event_ajaxSaveCompletionAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEventUser())             
            $this->forwardTo401Action();             
        $messages = mfMessages::getInstance();   
        $this->event_user=$this->getUser()->getGuardUser();
        $this->form=new SiteEventUserCompletionForm($this->event_user,$request->getPostParameter('SiteEventUserCompletion'));
         if (!$request->isMethod('POST') || !$request->getPostParameter('SiteEventUserCompletion'))
                return ;
        try
        {
            $this->form->bind($request->getPostParameter('SiteEventUserCompletion'),$request->getFiles('SiteEventUserCompletion'));
            if ($this->form->isvalid())
            {
                $this->event_user->add($this->form->getValues());                     
                $this->event_user->setAvatarFile($this->form->getAvatar());
                $this->event_user->save();                                    
                $messages->addInfo(__('Your account has been updated.'));      
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->event_user->add($this->form->getDefaults());
               // $this->employee->getCompany()->add($this->form->getDefault('company'));
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}


