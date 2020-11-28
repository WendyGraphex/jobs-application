<?php


class site_shop_ajaxDeleteShopAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteShop'));          
          $item= new SiteShop($id);           
          $item->delete();              
          $response = array("action"=>"DeleteShop","id" =>$id,"info"=>__(" Shop has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

