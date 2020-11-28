<?php


class employees_comment_ajaxPublishCommentAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeComment'));          
          $item= new EmployeeAdvertComment($id);           
          $item->publish();              
          $response = array("action"=>"PublishComment",
                            "published_at"=>__("Published at %s",(string)$item->getFormatter()->getPublishedAt()->getText()),
                            "id" =>$id,"info"=>__("Comment has been published."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

