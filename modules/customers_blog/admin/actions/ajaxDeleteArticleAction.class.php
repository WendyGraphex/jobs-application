<?php


class customers_blog_ajaxDeleteArticleAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerBlogArticle'));          
          $item= new CustomerBlogArticle($id);           
          $item->delete();              
          $response = array("action"=>"DeleteArticle","id" =>$id,"info"=>__("Article has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

