<?php


class site_gallery_ajaxDeletePictureGalleryAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {           
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('SitePictureGallery'));
          $picture_gallery= new SitePictureGallery($id);            
          $picture_gallery->delete();    
          $response = array("action"=>"DeletePictureGallery",
                            "id" =>$picture_gallery->get('id'),
                            "info"=>__("Picture has been deleted."));                  
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }  
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

