<?php


class customers_blog_ajaxDeleteActivityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $activity= new CustomerBlogActivity(array('id'=>$validator->isValid($request->getPostParameter('Activity'))));
          if ($activity->isLoaded())
          {    
            $activity->delete();
            $response = array("action"=>"DeleteActivity","id" =>$activity->get('id'));
          }
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
