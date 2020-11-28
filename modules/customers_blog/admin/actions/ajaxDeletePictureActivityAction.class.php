<?php


class customers_blog_ajaxDeletePictureActivityAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $activity= new CustomerBlogActivity(array('id'=>$validator->isValid($request->getPostParameter('Activity'))));
          if ($activity->isNotLoaded())
             throw new mfException(__('Activity is invalid.'));
          $activity->getPicture()->remove(); 
          $response = array("action"=>"DeletePictureActivity","id" =>$activity->get('id'));
           
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
