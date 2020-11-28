<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyTeacherUserCompletionForm.class.php";

class customers_academy_teacher_ajaxSaveCompletionAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isTeacherUser())             
            $this->forwardTo401Action();             
        $messages = mfMessages::getInstance();   
        $this->teacher_user=$this->getUser()->getGuardUser();
        $this->form=new CustomerAcademyTeacherUserCompletionForm($this->teacher_user,$request->getPostParameter('AcademyTeacherUserCompletion'));
         if (!$request->isMethod('POST') || !$request->getPostParameter('AcademyTeacherUserCompletion'))
                return ;
        try
        {
            $this->form->bind($request->getPostParameter('AcademyTeacherUserCompletion'),$request->getFiles('AcademyTeacherUserCompletion'));
            if ($this->form->isvalid())
            {
                $this->teacher_user->add($this->form->getValues());                     
                $this->teacher_user->setAvatarFile($this->form->getAvatar());
                $this->teacher_user->save();                                    
                $messages->addInfo(__('Your account has been updated.'));      
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->teacher_user->add($this->form->getDefaults());
               // $this->employee->getCompany()->add($this->form->getDefault('company'));
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}


