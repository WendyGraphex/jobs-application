<?php


class employees_ajaxDeleteLanguageLevelAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeLanguageLevel'));          
          $item= new EmployeeLanguageLevel($id);           
           $item->delete();              
          $response = array("action"=>"DeleteLanguageLevel","id" =>$id,"info"=>__("Employee Language Level has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

