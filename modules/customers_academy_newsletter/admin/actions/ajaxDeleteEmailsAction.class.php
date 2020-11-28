<?php

class customers_academy_newsletter_ajaxDeleteMultipleEmailAction extends mfAction {
        
    
    function execute(mfWebRequest $request) {             
      $messages = mfMessages::getInstance();
      try 
      {         
          $newslettersValidator=new mfValidatorSchemaForEach(new mfValidatorInteger(),count($request->getPostParameter('selection')));
          $newslettersValidator->isValid($request->getPostParameter('selection'));
          
          $newsletters= new CustomerAcademyNewsletterCollection($request->getPostParameter('selection'));
          $newsletters->delete();          
          $response = array("action"=>"DeleteMultipleEmail",
                            "parameters" =>$request->getPostParameter('selection')
                           );
      }     
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;      
    }

}

