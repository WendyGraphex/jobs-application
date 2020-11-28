<?php


class site_warning_ajaxDeleteWarningAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteWarning'));          
          $item= new SiteWarning($id);           
          $item->delete();              
          $response = array("action"=>"DeleteWarning","id" =>$id,"info"=>__("Employee Warning has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

