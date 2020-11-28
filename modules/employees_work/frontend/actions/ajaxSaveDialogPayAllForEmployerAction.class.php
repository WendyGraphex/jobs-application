<?php

 
class employees_work_ajaxSaveDialogPayAllForEmployerAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {          
        if (!$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();            
        $project=$request->getRequestParameter('project',new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser()));    
        if ($project->isNotLoaded())
            $this->forwardTo401Action();     
        $messages = mfMessages::getInstance();            
        try 
        {                  
            $project->getWork()->getEngine()->close();
         
            $project->close();
            
             $this->getEventDispather()->notify(new mfEvent($project,'project.close'));  
             
            $messages->addInfo(__("Project has been paid."));
            
            $engine =  new ProjectEmailEngine($project);
            $engine->sendClosed();
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        $request->addRequestParameter('project',  $project);
        $this->forward($this->getModuleName(), 'ajaxListPartialRequestForEmployer');
        
    }
    
   
}



