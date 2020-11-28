<?php


class employers_notation_ajaxDeleteCriteriaAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerNotationCriteria'));          
          $item= new EmployerNotationCriteria($id);           
          $item->delete();              
          $response = array("action"=>"DeleteCriteria","id" =>$id,"info"=>__("Employer Criteria has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

