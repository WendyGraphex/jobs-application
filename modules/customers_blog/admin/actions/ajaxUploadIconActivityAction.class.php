<?php

require_once __DIR__."/../locales/Forms/UploadIconActivityForm.class.php";


class customers_blog_ajaxUploadIconActivityAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $activity=new CustomerBlogActivity($request->getPostParameter('CustomerBlogActivity'));
        if ($activity->isNotLoaded())
            throw new mfException(__('Activity is invalid.'));
        $form=new UploadIconActivityForm($request->getPostParameter('UploadIconActivity'));
        $form->bind($request->getPostParameter('UploadIconActivity'),$request->getFiles('UploadIconActivity'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $activity->setIcon($form->getFile());
        $activity->save();    
        $response = array("action"=>"UploadIconActivity",   
                          "url"=>$activity->getIcon()->getMedium()->getUrl(),
                          "id" =>$activity->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}



