<?php

require_once __DIR__."/../locales/Forms/EmployeeCompletionForm.class.php";

class employees_ajaxSaveCompletionAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee())             
            $this->forwardTo401Action();             
        $messages = mfMessages::getInstance();   
        $this->user=$this->getUser();
        $this->employee=$this->getUser()->getGuardUser();
        $this->form=new EmployeeCompletionForm($this->employee,$request->getPostParameter('EmployeeCompletion'));
         if (!$request->isMethod('POST') || !$request->getPostParameter('EmployeeCompletion'))
                return ;
        try
        {
            $this->form->bind($request->getPostParameter('EmployeeCompletion'),$request->getFiles('EmployeeCompletion'));
            if ($this->form->isvalid())
            {
                $this->employee->add($this->form->getValues());       
               /* if ($this->form->hasCompany())
                {    
                     $this->employee->getCompany()->add($this->form->getValuesForCompany())->save();               
                    $this->employee->set('company_id',$this->employee->getCompany());                        
                }  */  
                $this->employee->setAvatarFile($this->form->getAvatar());
                $this->employee->save();     
                $this->employee->updateCategories($this->form->getCategories());
                 if ($this->employee->isProfileCompleted())
                    $messages->addInfo(__('Your account has been updated and completed.'));         
                else
                    $messages->addInfo(__('Your account has been updated.'));     
                 if ($this->form->isCompleted())
                {
                    $engine_email=new EmployeeEmailEngine($this->employee);
                    $engine_email->sendCongratulations();    
                }  
                $this->forward($this->getModuleName(), 'ajaxDashboard');
            }   
            else
            {
                // var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__('Form has some errors.'));             
                $this->employee->add($this->form->getDefaults());
               // $this->employee->getCompany()->add($this->form->getDefault('company'));
                
              //  var_dump($this->form->getCategories()->getKeys());
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}


