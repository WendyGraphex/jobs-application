<?php

require_once __DIR__."/../locales/Forms/UploadPictureCategoryNewForm.class.php";

class partners_ajaxUploadPictureNewCategoryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {          
          $form = new UploadPictureCategoryNewForm();
          $form->bind($request->getPostParameter('UploadPictureCategory'),$request->getFiles('UploadPictureCategory'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Category is invalid.'));
          } 
          
        $form->getCategory()->setPicture($form->getFile());
        $form->getCategory()->upload();      
        $response = array("action"=>"UploadPictureNewCategory",   
                          "url"=>$form->getCategory()->getPicture()->getMedium()->getUrl(),
                          "id" =>$form->getCategory()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


