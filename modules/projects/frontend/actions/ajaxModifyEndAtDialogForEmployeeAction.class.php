<?php

require_once __DIR__."/../locales/Forms/ProjectEndAtDateForm.class.php"; 

class projects_ajaxModifyEndAtDialogForEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();             
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ;   
         $this->form=new ProjectEndAtDateForm($this->project);
        if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectDate'))
            return ;
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        $response=array('action'=>'ModifyEndAtDialogForEmployee');       
        $this->form->bind($request->getPostParameter('ProjectDate'));
        if ($this->form->isValid())
        {
            $this->project->add($this->form->getValues())->process()->save();
            $response['status']='OK';
            $response['end_at']=$this->project->getFormatter()->getEndAt()->getText();
            // Update work
            $this->project->getWork()->add(array('end_at'=>$this->form->getEndAt(),
                                                 'number_of_hours'=>$this->project->get('duration')))->save();
            // envoi email changement de date
            $engine=new ProjectEmailEngine($this->project);
            $engine->sendEndAtChange();
        }
        else
        {
            $response['errors']=$this->form->getErrorSchema()->getErrorsMessage();
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;        
    }
    
   
}

