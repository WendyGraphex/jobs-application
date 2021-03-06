<?php


class system_emails_ajaxDeleteModelI18nAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {        
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SystemModelEmailI18n'));          
          $item= new SystemModelEmail($id);           
          $item->delete();              
          $response = array("action"=>"deleteModelI18n","id" =>$id,"info"=>__("Model has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

