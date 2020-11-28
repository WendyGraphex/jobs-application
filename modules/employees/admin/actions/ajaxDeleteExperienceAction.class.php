<?php


class employees_ajaxDeleteExperienceAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeExperience'));          
          $item= new EmployeeExperience($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteExperience","id" =>$id,"info"=>__("Employee Experience has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

