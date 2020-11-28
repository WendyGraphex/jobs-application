<?php

require_once __DIR__."/../locales/Forms/CustomerAcademyStudentUserCompletionForm.class.php";

class customers_academy_student_ajaxSaveCompletionAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isStudentUser())             
            $this->forwardTo401Action();             
        $messages = mfMessages::getInstance();   
        $this->student_user=$this->getUser()->getGuardUser();
        $this->form=new CustomerAcademyStudentUserCompletionForm($this->student_user,$request->getPostParameter('AcademyStudentUserCompletion'));
         if (!$request->isMethod('POST') || !$request->getPostParameter('AcademyStudentUserCompletion'))
                return ;
        try
        {
            $this->form->bind($request->getPostParameter('AcademyStudentUserCompletion'),$request->getFiles('AcademyStudentUserCompletion'));
            if ($this->form->isvalid())
            {
                $this->student_user->add($this->form->getValues());                     
                $this->student_user->setAvatarFile($this->form->getAvatar());
                $this->student_user->save();                                    
                $messages->addInfo(__('Your account has been updated.'));      
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->student_user->add($this->form->getDefaults());
               // $this->employee->getCompany()->add($this->form->getDefault('company'));
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}


