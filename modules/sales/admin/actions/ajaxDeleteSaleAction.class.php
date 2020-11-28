<?php


class sales_ajaxDeletSaleAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $sale= new Sale(array('id'=>$validator->isValid($request->getPostParameter('Sale'))));
          if ($sale->isLoaded())
          {    
            $sale->set('status','DELETE');
            $sale->delete();
            $response = array("action"=>"DeleteSale","id" =>$sale->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
