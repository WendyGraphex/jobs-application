<?php

require_once __DIR__."/../locales/Forms/ProjectStartAtDateForm.class.php"; 

class projects_ajaxModifyStartAtDialogForEmployeeAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();                 
        $this->project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
        if ($this->project->isNotLoaded())
            return ; 
        if ($this->project->hasPayments() && $this->project->hasStartAt())
            $this->forwardTo401Action();
        $this->form=new ProjectStartAtDateForm($this->project);
        if (!$request->isMethod('POST') || !$request->getPostParameter('ProjectDate'))
            return ;
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        $response=array('action'=>'ModifyEndAtDialogForEmployee');        
        $this->form->bind($request->getPostParameter('ProjectDate'));
        if ($this->form->isValid())
        {
            $this->project->add($this->form->getValues())->process()->save();           
            $response['status']='OK';
            $response['start_at']=$this->project->getFormatter()->getStartAt()->getText();
        // Update work
             $this->project->getWork()->add(array('start_at'=>$this->form->getStartAt(),
                                                 'number_of_hours'=>$this->project->get('duration')))->save();
            $engine=new ProjectEmailEngine($this->project);
            $engine->sendStartAtChange();
        }
        else
        {
            $response['errors']=$this->form->getErrorSchema()->getErrorsMessage();
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;    
    }
    
   
}

