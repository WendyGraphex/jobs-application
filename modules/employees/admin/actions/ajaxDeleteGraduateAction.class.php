<?php


class employees_ajaxDeleteGraduateDiplomaAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeGraduateDiploma'));          
          $item= new EmployeeGraduateDiploma($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteGraduate","id" =>$id,"info"=>__("Employee Graduate Diploma has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

