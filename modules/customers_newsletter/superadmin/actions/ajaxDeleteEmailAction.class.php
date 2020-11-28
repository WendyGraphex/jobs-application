<?php

class customers_newsletter_ajaxDeleteEmailAction extends mfAction {
    
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
         $newsletter=new newsletter($request->getPostParameter('newsletter'),$site);
         $newsletter->delete(); 
         $response = array("action"=>"deleteEmail",
                           "id" =>$request->getPostParameter('newsletter')
                          );
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

