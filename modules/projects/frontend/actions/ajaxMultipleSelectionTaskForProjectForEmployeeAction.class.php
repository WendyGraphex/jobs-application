<?php

require_once dirname(__FILE__)."/../locales/Forms/MultipleSelectionTaskForProjectForm.class.php";
require_once dirname(__FILE__)."/../locales/Forms/MultipleSelectionTaskProcessForProjectForm.class.php";

class projects_ajaxMultipleSelectionTaskForProjectForEmployeeAction extends mfAction {
    
       
    
   
        
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();  
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();      
        $this->project=new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;
        $this->form_multiple=new MultipleSelectionTaskForProjectForm($this->getUser(),$request->getPostParameter('MultipleSelection'));                
        $this->form_multiple->bind($request->getPostParameter('MultipleSelection'));
        try
        {
            if ($this->form_multiple->isValid())
            {
               $this->form=new MultipleSelectionTaskProcessForProjectForm($this->project,$this->getUser());
               $this->form->setSelection($this->form_multiple->getSelection());              
            }  
            else
            {
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                $messages->addError(__("Form has some errors."));
            }
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }        
    }

}
