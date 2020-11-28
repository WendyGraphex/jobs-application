<?php

require_once dirname(__FILE__)."/../locales/Forms/MultipleSelectionTaskProcessForProjectForm.class.php";


class projects_ajaxMultipleSelectionTaskProcessForProjectForEmployerAction extends mfAction {
    
                      
    function execute(mfWebRequest $request) {              
        $messages = mfMessages::getInstance();                        
       if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();  
        $this->project=new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;
        $this->form=new MultipleSelectionTaskProcessForProjectForm($this->project,$this->getUser(),$request->getPostParameter('MultipleSelection'));        
        $this->form->bind($request->getPostParameter('MultipleSelection'));
        try
        {
            if ($this->form->isValid())  
            {                    
               $multiple=new ProjectTaskMultipleProcess($this->form,$this->getUser());
               $multiple->process();              
               $messages->addInfos($multiple->getMessages());         
               $messages->addErrors($multiple->getErrors()); 
               $request->addRequestParameter('project', $this->project);
               $request->addRequestParameter('filter', array('selection'=>$this->form->getSelection()->toArray()));
               $this->forward($this->getModuleName(),'ajaxListPartialTaskForProjectForEmployer');
            }  
            else
            {            
                $messages->addError(__("Form has some errors."));
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
    }

}
