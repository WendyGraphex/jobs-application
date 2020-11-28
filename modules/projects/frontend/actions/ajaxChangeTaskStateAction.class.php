<?php

 require_once dirname(__FILE__)."/../locales/Forms/ProjectTaskChangeStateForm.class.php";
 
class projects_ajaxChangeTaskStateAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {   
               if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
          $form=new ProjectTaskChangeStateForm($this->getUSer()->getGuardUser());
          $form->bind($request->getPostParameter('ProjectTask'));
          if ($form->isValid())
          {    
            $form->getTask()->set('state_id',$form->getState())->save();
            $response = array("action"=>"ChangeTaskState",
                               "info"=>__("State has been changed."));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

