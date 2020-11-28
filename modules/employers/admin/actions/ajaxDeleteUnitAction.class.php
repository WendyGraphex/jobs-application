<?php


class employers_ajaxDeleteUnitAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('EmployerBudgetUnit'));          
          $item= new EmployerBudgetUnit($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteUnit","id" =>$id,"info"=>__("Budget Unit has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

