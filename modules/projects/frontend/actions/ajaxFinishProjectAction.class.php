<?php

 
class projects_ajaxFinishProjectAction extends mfAction {
    
             
    function execute(mfWebRequest $request) {            
        if (!$this->getUser()->isEmployee())             
            $this->forwardTo401Action();
        $messages = mfMessages::getInstance();   
        try
        {
            $project = new Project($request->getPostParameter('Project'),$this->getUser()->getGuardUser());
            if ($project->isNotLoaded())
                throw new mfException(__('Project is invalid.'));
            $response= array('action'=>'FinishProject','id'=>$project->get('id'),'info'=>__('Project has been finished.'));
            if ($project->getStatus()->isFinish())
                return $response;                        
            
          //  $project->getStatus()->finish();
            
            $project->getWork()->getEngine()->finish();                                                           
            
         //   $engine = new ProjectEmailEngine($project);
         //   $engine->sendFinished();
                         
            $this->getEventDispather()->notify(new mfEvent($project,'project.finished'));  
             
        } catch (mfException $ex) {
            $messages->addError($ex);
        }                
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;    
    }
    
   
}

