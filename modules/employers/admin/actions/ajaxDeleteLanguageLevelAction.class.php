<?php


class employers_ajaxDeleteLanguageLevelAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerLanguageLevel'));          
          $item= new EmployerLanguageLevel($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteLanguageLevel","id" =>$id,"info"=>__("Employer Language Level has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

