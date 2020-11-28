<?php

class customers_newsletter_ajaxDeleteEmailsAction extends mfAction {
    
    const SITE_NAMESPACE = 'system/site';
    
    function execute(mfWebRequest $request) { 
      if (!$request->isXmlHttpRequest()) 
            $this->redirect("/superadmin/admin");
      $messages = mfMessages::getInstance();
      try 
      {
          $site=$this->getUser()->getStorage()->read(self::SITE_NAMESPACE);
          if (!$site) 
              throw new mfException(__("thanks to select a site"));  
          $newslettersValidator=new mfValidatorSchemaForEach(new mfValidatorInteger(),count($request->getPostParameter('selection')));
          $newslettersValidator->isValid($request->getPostParameter('selection'));
          
          $newsletters= new NewsletterCollection($request->getPostParameter('selection'),$site);
          $newsletters->delete();          
          $response = array("action"=>"deleteEmails",
                            "parameters" =>$request->getPostParameter('selection')
                           );
      } 
      catch (mfValidatorErrorSchema $e)
      {
          $messages->addErrors(array_merge($e->getGlobalErrors(),$e->getErrors()));
      }
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;      
    }

}

