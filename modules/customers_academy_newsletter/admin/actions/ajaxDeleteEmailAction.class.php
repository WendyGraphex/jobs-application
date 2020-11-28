<?php

class customers_academy_newsletter_ajaxDeleteEmailAction extends mfAction {
       
    
    function execute(mfWebRequest $request) {           
      $messages = mfMessages::getInstance();
      try 
      {       
         $newsletter=new CustomerAcademyNewsletter($request->getPostParameter('CustomerAcademyNewsletter'));
         $newsletter->delete(); 
         $response = array("action"=>"DeleteEmail",
                           "id" =>$request->getPostParameter('CustomerAcademyNewsletter')
                          );
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

