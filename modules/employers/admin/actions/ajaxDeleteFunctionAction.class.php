<?php


class employers_ajaxDeleteFunctionAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerFunction'));          
          $item= new EmployerFunction($id);           
           $item->delete();              
          $response = array("action"=>"DeleteFunction","id" =>$id,"info"=>__("Employer Function has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

