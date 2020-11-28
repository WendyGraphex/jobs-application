<?php


class projects_ajaxDeleteTaskStateI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('ProjectTaskStateI18n'));          
          $item= new ProjectTaskStateI18n($id);           
          $item->delete();              
          $response = array("action"=>"DeleteTaskStateI18n","id" =>$id,"info"=>__("TaskState has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

