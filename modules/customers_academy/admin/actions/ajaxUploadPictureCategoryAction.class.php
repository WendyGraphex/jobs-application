<?php

require_once __DIR__."/../locales/Forms/UploadPictureCategoryForm.class.php";


class customers_academy_ajaxUploadPictureCategoryAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $category=new CustomerCourseCategory($request->getPostParameter('CustomerCourseCategory'));
        if ($category->isNotLoaded())
            throw new mfException(__('Category is invalid.'));
        $form=new UploadPictureCategoryForm($request->getPostParameter('UploadPictureCategory'));
        $form->bind($request->getPostParameter('UploadPictureCategory'),$request->getFiles('UploadPictureCategory'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $category->setPicture($form->getFile());
        $category->save();    
        $response = array("action"=>"UploadPictureCategory",   
                          "url"=>$category->getPicture()->getMedium()->getUrl(),
                          "id" =>$category->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


