<?php


class sales_quotation_ajaxDeleteQuotationAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $SaleQuotation= new SaleQuotation(array('id'=>$validator->isValid($request->getPostParameter('SaleQuotation'))));
          if ($SaleQuotation->isLoaded())
          {    
            $SaleQuotation->set('status','DELETE');
            $SaleQuotation->delete();
            $response = array("action"=>"DeleteQuotation","id" =>$SaleQuotation->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
