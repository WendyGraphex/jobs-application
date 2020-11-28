<?php

require_once __DIR__."/../locales/Forms/UploadPictureActivityForm.class.php";


class customers_blog_ajaxUploadPictureActivityAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $activity=new CustomerBlogActivity($request->getPostParameter('CustomerBlogActivity'));
        if ($activity->isNotLoaded())
            throw new mfException(__('Activity is invalid.'));
        $form=new UploadPictureActivityForm($request->getPostParameter('UploadPictureActivity'));
        $form->bind($request->getPostParameter('UploadPictureActivity'),$request->getFiles('UploadPictureActivity'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $activity->setPicture($form->getFile());
        $activity->save();    
        $response = array("action"=>"UploadPictureActivity",   
                          "url"=>$activity->getPicture()->getMedium()->getUrl(),
                          "id" =>$activity->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


