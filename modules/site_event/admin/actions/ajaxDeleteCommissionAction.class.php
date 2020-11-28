<?php

class site_event_ajaxDeleteCommissionAction extends mfAction {
           
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {          
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteEventSellerCommission'));          
          $item= new SiteEventSellerCommission($id);  
          if ($item->isNotLoaded())
              throw new mfException(__('Sale commission is invalid.'));
              $item->delete();              
          $response = array("action"=>"DeleteCommission","id" =>$id,"info"=>__("Commission [%s] has been deleted.",$item->get('name')));        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

