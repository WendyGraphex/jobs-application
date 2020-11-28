<?php


class site_event_ajaxDeleteUserAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
        try 
        {         
              $item=new mfValidatorInteger();
              $id=$item->isValid($request->getPostParameter('SiteEventUser'));          
              $item= new SiteEventUser($id);           
              $item->delete();              
              $response = array("action"=>"DeleteUser","id" =>$id,"info"=>__("User has been deleted."));
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
