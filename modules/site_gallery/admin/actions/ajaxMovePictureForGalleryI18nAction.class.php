<?php

require_once __DIR__."/../locales/Forms/SitePictureForGalleryI18nMoveForm.class.php";

class site_gallery_ajaxMovePictureForGalleryI18nAction extends mfAction {
            
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
            $form = new SitePictureForGalleryI18nMoveForm();
            $form->bind($request->getPostParameter('SitePicturePosition'));
            if (!$form->isValid())           
                  throw new mfException(__('Form has some errors.'));            
            $form->getNode()->moveToPrevious($form->getSibling());            
            $response = array("action"=>"MovePictureForGalleryI18n");
          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
