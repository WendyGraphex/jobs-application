<?php


class site_city_ajaxDeleteCityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SiteCity'));          
          $item= new SiteCity($id);           
       //   $item->delete();              
          $response = array("action"=>"DeleteCity","id" =>$id,"info"=>__("City has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

