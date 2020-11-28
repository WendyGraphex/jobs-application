<?php


class employers_ajaxDeleteActivityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerActivity'));          
          $item= new EmployerActivity($id);           
          $item->delete();              
          $response = array("action"=>"DeleteActivity","id" =>$id,"info"=>__("Employer Activity has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

