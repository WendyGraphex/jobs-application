<?php


class projects_ajaxDeleteTaskAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
         if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('ProjectTask'));          
          $item= new ProjectTask($id,$this->getUser()->getGuardUser());           
          $item->delete();              
          $response = array("action"=>"DeleteTask","id" =>$id,"info"=>__("Task has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

