<?php

class sales_ajaxDeleteEmployeeCommissionAction extends mfAction {
           
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {          
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SaleEmployeeCommission'));          
          $item= new SaleEmployeeCommission($id);  
          if ($item->isNotLoaded())
              throw new mfException(__('Sale commission is invalid.'));
              $item->delete();              
          $response = array("action"=>"DeleteEmployeeCommission","id" =>$id,"info"=>__("Commission [%s] has been deleted.",$item->get('name')));        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

