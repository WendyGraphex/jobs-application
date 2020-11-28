<?php


class projects_ajaxEnableTaskAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {     
            if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('ProjectTask'));          
          $item= new ProjectTask($id,$this->getUser()->getGuardUser()); 
          if ($item->isNotLoaded())
              throw new mfException(__('Task is invalid'));          
          $item->enable();              
          $response = array("action"=>"EnableTask","id" =>$id,"info"=>__("Task has been enabled."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

