<?php

require_once __DIR__."/../locales/Forms/UploadPictureArticleForm.class.php";


class customers_blog_ajaxUploadPictureArticleAction extends mfAction {
    
    
        
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();   
      try 
      {
        $article=new CustomerBlogArticle($request->getPostParameter('CustomerBlogArticle'));
        if ($article->isNotLoaded())
            throw new mfException(__('Article is invalid.'));
        $form=new UploadPictureArticleForm($request->getPostParameter('UploadPictureArticle'));
        $form->bind($request->getPostParameter('UploadPictureArticle'),$request->getFiles('UploadPictureArticle'));
        if (!$form->isValid())
            throw new mfException(__("Form is invalid."));
        $article->setPicture($form->getFile());
        $article->save();    
        $response = array("action"=>"UploadPictureArticle",   
                          "url"=>$article->getPicture()->getMedium()->getUrl(),
                          "id" =>$article->get('id'));            
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }

}


