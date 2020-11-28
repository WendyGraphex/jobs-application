<?php

require_once __DIR__."/../locales/Forms/UploadPictureActivityNewForm.class.php";

class customers_blog_ajaxUploadPictureNewActivityAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {          
          $form = new UploadPictureActivityNewForm();
          $form->bind($request->getPostParameter('UploadPictureActivity'),$request->getFiles('UploadPictureActivity'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Activity is invalid.'));
          } 
          
        $form->getActivity()->setPicture($form->getFile());
        $form->getActivity()->upload();      
        $response = array("action"=>"UploadPictureNewActivity",   
                          "url"=>$form->getActivity()->getPicture()->getMedium()->getUrl(),
                          "id" =>$form->getActivity()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


