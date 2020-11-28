<?php


class customers_blog_ajaxDeletePictureArticleAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $article= new CustomerBlogArticle(array('id'=>$validator->isValid($request->getPostParameter('CustomerBlogArticle'))));
          if ($article->isNotLoaded())
             throw new mfException(__('Article is invalid.'));
          $article->getPicture()->remove(); 
          $response = array("action"=>"DeletePictureArticle","id" =>$article->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
