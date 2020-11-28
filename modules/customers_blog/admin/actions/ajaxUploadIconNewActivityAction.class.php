<?php

require_once __DIR__."/../locales/Forms/UploadIconActivityNewForm.class.php";
 
class customers_blog_ajaxUploadIconNewActivityAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {          
          $form = new UploadIconActivityNewForm();
          $form->bind($request->getPostParameter('UploadIconActivity'),$request->getFiles('UploadIconActivity'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Activity is invalid.'));
          } 
          
        $form->getActivity()->setIcon($form->getFile());
        $form->getActivity()->upload();      
        $response = array("action"=>"UploadIconNewActivity",   
                          "url"=>$form->getActivity()->getIcon()->getMedium()->getUrl(),
                          "id" =>$form->getActivity()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


