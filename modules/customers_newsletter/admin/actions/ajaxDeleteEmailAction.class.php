<?php

class customers_newsletter_ajaxDeleteEmailAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {           
      $messages = mfMessages::getInstance();
      try 
      {       
         $newsletter=new CustomerNewsletter($request->getPostParameter('CustomerNewsletter'));
         $newsletter->delete(); 
         $response = array("action"=>"DeleteEmail",
                           "id" =>$request->getPostParameter('CustomerNewsletter')
                          );
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

