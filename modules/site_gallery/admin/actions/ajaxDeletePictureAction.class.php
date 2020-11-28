<?php


class site_gallery_ajaxDeletePictureAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {
          
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SitePicture'));          
          $item= new SitePicture($id);          
          $item->delete();                   
          $response = array("action"=>"DeletePicture","id" =>$id);
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

