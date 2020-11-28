<?php


class employers_notation_ajaxDeleteCategoryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerNotationCategory'));          
          $item= new EmployerNotationCategory($id);           
          $item->delete();              
          $response = array("action"=>"DeleteCategory","id" =>$id,"info"=>__("Employer Category has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

