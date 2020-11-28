<?php


class customers_academy_ajaxDeleteTopicAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();   
      try 
      {         
          $item=new mfValidatorInteger();
          $id=$item->isValid($request->getPostParameter('CustomerAcademyTopic'));          
          $item= new CustomerAcademyTopic($id);           
           $item->delete();              
          $response = array("action"=>"DeleteTopic","id" =>$id,"info"=>__("Employee Study Topic has been deleted."));
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}

