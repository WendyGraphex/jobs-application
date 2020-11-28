<?php


class customers_blog_ajaxPublishArticleAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerBlogArticle'));          
          $item= new CustomerBlogArticle($id);           
          $item->publish();              
          $response = array("action"=>"PublishArticle","id" =>$id,
                            "published_at"=>(string)$item->getFormatter()->getPublishedAt()->getFormatted(),
                            "info"=>__("Article has been published."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

