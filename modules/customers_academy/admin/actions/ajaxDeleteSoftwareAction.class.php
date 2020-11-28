<?php


class customers_academy_ajaxDeleteSoftwareAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerAcademySoftware'));          
          $item= new CustomerAcademySoftware($id);           
           $item->delete();              
          $response = array("action"=>"DeleteSoftware","id" =>$id,"info"=>__("Employee Study Software has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

