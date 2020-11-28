<?php


class customers_contact_ajaxDeleteAbuseTypeAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerAbuseType'));          
          $item= new CustomerAbuseType($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteAbuseType","id" =>$id,"info"=>__("Customer Abuse Type has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

