<?php


class employees_notation_ajaxDeleteCategoryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployeeNotationCategory'));          
          $item= new EmployeeNotationCategory($id);           
          $item->delete();              
          $response = array("action"=>"DeleteCategory","id" =>$id,"info"=>__("Employee Category has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

