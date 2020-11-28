<?php


class employers_ajaxDeleteTypeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerContractType'));          
          $item= new EmployerContractType($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteType","id" =>$id,"info"=>__(" Contract Type has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

