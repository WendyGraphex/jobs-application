<?php


class cart_ajaxDeleteCartAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('Cart'));          
          $item= new Cart($id);           
          $item->delete();              
          $response = array("action"=>"DeleteCart","id" =>$id,"info"=>__("Cart has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
