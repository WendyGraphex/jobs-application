<?php


class site_help_ajaxDeleteHelpAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteHelp'));          
          $item= new SiteHelp($id);           
          $item->delete();              
          $response = array("action"=>"DeleteHelp","id" =>$id,"info"=>__("Employee Help has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

