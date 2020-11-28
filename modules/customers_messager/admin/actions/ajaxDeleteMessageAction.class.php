<?php


class customers_messager_ajaxDeleteMessageAction extends mfAction {
    
    
    
    function execute(mfWebRequest $request) {     
      $messages = mfMessages::getInstance();   
      try 
      {         
          $validator=new mfValidatorInteger();
          $item= new CustomerMessage($validator->isValid($request->getPostParameter('CustomerMessage')));
          if ($item->isNotLoaded())
              throw new mfException(__('Message is invalid'));      
            $item->delete();
            $response = array("action"=>"DeleteMessage","id" =>$item->get('id'),"info"=>__("Message has been deleted."));        
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
}
