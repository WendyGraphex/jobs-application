<?php

require_once __DIR__."/../locales/Forms/UploadPictureArticleNewForm.class.php";

class customers_blog_ajaxUploadPictureNewArticleAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {          
          $form = new UploadPictureArticleNewForm();
          $form->bind($request->getPostParameter('UploadPictureArticle'),$request->getFiles('UploadPictureArticle'));
          if (!$form->isValid()) 
          {
           //  var_dump($form->getErrorSchema()->getErrorsMessage())    ;
             throw new mfException(__('Article is invalid.'));
          } 
          
        $form->getArticle()->setPicture($form->getFile());
        $form->getArticle()->upload();      
        $response = array("action"=>"UploadPictureNewArticle",   
                          "url"=>$form->getArticle()->getPicture()->getMedium()->getUrl(),
                          "id" =>$form->getArticle()->get('id')
                     );            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


