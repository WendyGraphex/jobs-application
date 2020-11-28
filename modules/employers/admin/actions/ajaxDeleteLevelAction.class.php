<?php


class employers_ajaxDeleteLevelAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerLevel'));          
          $item= new EmployerLevel($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteLevel","id" =>$id,"info"=>__("Employer Level has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

