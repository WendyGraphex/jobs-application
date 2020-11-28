<?php


class employees_ajaxDeleteFunctionAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeFunction'));          
          $item= new EmployeeFunction($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteFunction","id" =>$id,"info"=>__("Employee Function has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

