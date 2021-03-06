<?php


class employers_ajaxDeleteGalleryAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $gallery= new EmployerGallery($validator->isValid($request->getPostParameter('EmployerGallery')));
          if ($gallery->isNotLoaded())
              throw new mfException(__('Gallery is invalid'));      
          //  $gallery->delete();
            $response = array("action"=>"DeleteGallery","id" =>$id,"info"=>__("Gallery has been deleted."));        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
