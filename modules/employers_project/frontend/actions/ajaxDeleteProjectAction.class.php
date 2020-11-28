<?php


class employers_project_ajaxDeleteProjectAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
              if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployerUser()) 
                $this->forwardTo401Action();
            $item = new EmployerProject($request->getPostParameter('EmployerProject'),$this->getUser()->getGuardUser());
            if ($item->isNotLoaded())
                throw new mfException(__('Project is invalid.'));
            $item->delete();
            
            $response=array('action'=>'DeleteProject',                             
                            'id'=>$item->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


