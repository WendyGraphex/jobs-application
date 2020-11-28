<?php


class site_event_ajaxDeleteEventAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteEvent'));          
          $item= new SiteEvent($id);           
          $item->delete();              
          $response = array("action"=>"DeleteEvent","id" =>$id,"info"=>__("Event has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

