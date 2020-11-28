<?php


class employers_ajaxDeleteCityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $gallery= new EmployerCityGallery($validator->isValid($request->getPostParameter('EmployerCityGallery')));
          if ($gallery->isLoaded())
          {    
          //  $gallery->delete();
            $response = array("action"=>"DeleteCity","id" =>$gallery->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
