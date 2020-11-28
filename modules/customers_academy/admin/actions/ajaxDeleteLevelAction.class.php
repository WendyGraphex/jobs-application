<?php


class customers_academy_ajaxDeleteLevelAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerAcademyLevel'));          
          $item= new CustomerAcademyLevel($id);           
           $item->delete();              
          $response = array("action"=>"DeleteLevel","id" =>$id,"info"=>__("Employee Study Level has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

