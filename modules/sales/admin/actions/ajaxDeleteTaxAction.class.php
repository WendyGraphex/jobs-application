<?php

 
class sales_ajaxDeleteTaxAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {          
          $validator=new mfValidatorInteger();
          $id=$validator->isValid($request->getPostParameter('SaleTax'));
          $item= new SaleTax($id);
          $item->delete();          
        //  $this->getEventDispather()->notify(new mfEvent($item, 'taxes.change','delete')); 
          $response = array("action"=>"DeleteTax",
                            "info"=>__("Tax has been deleted."),
                            "id" =>$id);
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
    
    
    
}

