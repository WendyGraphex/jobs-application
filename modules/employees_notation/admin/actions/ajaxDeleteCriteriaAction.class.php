<?php


class employees_notation_ajaxDeleteCriteriaAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeNotationCriteria'));          
          $item= new EmployeeNotationCriteria($id);           
          $item->delete();              
          $response = array("action"=>"DeleteCriteria","id" =>$id,"info"=>__("Employee Criteria has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

